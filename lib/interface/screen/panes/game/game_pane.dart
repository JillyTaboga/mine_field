import 'package:fluent_ui/fluent_ui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/entities/game_entity.dart';
import '../../../widgets/finish_dialog.dart';
import '../../../widgets/game_header.dart';
import '../../../widgets/number_of_bombs.dart';
import '../settings/settings_controller.dart';
import 'game_controller.dart';

final _cellHoverProvider = StateProvider<GameCell?>((ref) {
  return;
});

final _isShowingEndgame = StateProvider<bool>((ref) => false);

class GamePane extends HookConsumerWidget {
  const GamePane({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch(gameProvider);
    final dificult = ref.watch(dificultProvider);
    final status = ref.watch(gameStatusProvider);
    final counter = ref.watch(timeProvider);
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      if (status == GameStatus.lost || status == GameStatus.won) {
        final isShowing = ref.read(_isShowingEndgame);
        if (!isShowing) {
          ref.read(_isShowingEndgame.notifier).state = true;
          await showDialog<bool>(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return FinishDialog(
                  status: status,
                  game: game,
                );
              });
          ref.read(_isShowingEndgame.notifier).state = false;
        }
      }
    });
    return ScaffoldPage(
      header: GameHeader(status: status, counter: counter),
      content: LayoutBuilder(
        builder: (context, constraints) {
          final size = constraints.maxWidth / dificult.size;
          return Center(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: Row(
                  children: List.generate(
                    dificult.size,
                    (index) {
                      final row = index;
                      return Column(
                        children: List.generate(dificult.size, (index) {
                          final column = index;
                          final cell = game.cells
                              .where((element) =>
                                  element.column == column &&
                                  element.row == row)
                              .first;
                          final hover = cell == ref.watch(_cellHoverProvider);
                          final numberOfBombs = cell.numberOfNeighbor(game);
                          return MouseRegion(
                            onEnter: (pointer) {
                              ref.read(_cellHoverProvider.notifier).state =
                                  cell;
                            },
                            onExit: (pointer) {
                              ref.read(_cellHoverProvider.notifier).state =
                                  null;
                            },
                            child: GestureDetector(
                              onSecondaryTap:
                                  (cell.clicked || status != GameStatus.running)
                                      ? null
                                      : () {
                                          ref
                                              .read(gameProvider.notifier)
                                              .onRightClick(
                                                row: row,
                                                column: column,
                                              );
                                        },
                              onTap: (cell.clicked ||
                                      status != GameStatus.running)
                                  ? null
                                  : () {
                                      ref.read(gameProvider.notifier).onClick(
                                            row: row,
                                            column: column,
                                          );
                                    },
                              child: GameCellWidget(
                                size: size,
                                cell: cell,
                                hover: hover,
                                numberOfBombs: numberOfBombs,
                                isOver: status == GameStatus.lost,
                              ),
                            ),
                          );
                        }),
                      );
                    },
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class GameCellWidget extends StatelessWidget {
  const GameCellWidget({
    Key? key,
    required this.size,
    required this.cell,
    required this.hover,
    required this.numberOfBombs,
    required this.isOver,
  }) : super(key: key);

  final double size;
  final GameCell cell;
  final bool hover;
  final int numberOfBombs;
  final bool isOver;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: size,
      width: size,
      constraints: const BoxConstraints(
        minWidth: 15,
        minHeight: 15,
        maxHeight: 30,
        maxWidth: 30,
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.black,
        ),
        borderRadius: BorderRadius.circular(2),
        color: cell.clicked
            ? Colors.white
            : hover
                ? FluentTheme.of(context).accentColor
                : Colors.grey.withOpacity(0.3),
      ),
      child: LayoutBuilder(builder: (context, constraintsCell) {
        final iconSize = constraintsCell.maxWidth / 1.5;
        return Center(
          child: (cell.hasBomb && (cell.clicked || isOver))
              ? Icon(
                  FluentIcons.alert_solid,
                  color: Colors.red,
                  size: iconSize,
                )
              : cell.clicked
                  ? numberOfBombs == 0
                      ? null
                      : NumberOfBombsText(
                          numberOfBombs: numberOfBombs,
                        )
                  : (cell.flag == Flag.hasBomb)
                      ? Icon(
                          cell.flag!.icon,
                          color: Colors.red,
                          size: iconSize,
                        )
                      : (cell.flag == Flag.notSure)
                          ? Icon(
                              cell.flag!.icon,
                              color: Colors.yellow,
                              size: iconSize,
                            )
                          : null,
        );
      }),
    );
  }
}
