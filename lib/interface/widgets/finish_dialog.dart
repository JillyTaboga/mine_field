import 'package:fluent_ui/fluent_ui.dart';
import 'package:mine_field/domain/entities/game_entity.dart';
import 'package:mine_field/interface/screen/panes/game/game_controller.dart';

class FinishDialog extends StatelessWidget {
  const FinishDialog({
    Key? key,
    required this.status,
    required this.game,
  }) : super(key: key);

  final GameStatus status;
  final GameEntity game;

  @override
  Widget build(BuildContext context) {
    return ContentDialog(
      backgroundDismiss: false,
      title: Text(status.label),
      content: Text(
          'Restaram ${game.remainingCells.toString()} quadrados dos quais ${game.remainingBombs.toString()} eram bombas'),
      actions: [
        Button(
            child: const Text('Novo jogo'),
            onPressed: () {
              Navigator.pop(context, true);
            })
      ],
    );
  }
}
