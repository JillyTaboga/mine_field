import 'package:fluent_ui/fluent_ui.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/entities/game_entity.dart';
import '../screen/panes/game/game_controller.dart';

class FinishDialog extends HookConsumerWidget {
  const FinishDialog({
    Key? key,
    required this.status,
    required this.game,
  }) : super(key: key);

  final GameStatus status;
  final GameEntity game;

  @override
  Widget build(BuildContext context, ref) {
    final mounted = useIsMounted();
    return ContentDialog(
      backgroundDismiss: false,
      title: Text(status.label),
      content: Text(
          'Restaram ${game.remainingCells.toString()} quadrados dos quais ${game.remainingBombs.toString()} eram bombas'),
      actions: [
        Button(
            child: const Text('Novo jogo'),
            onPressed: () async {
              await ref.read(gameProvider.notifier).newGame();
              // ignore: use_build_context_synchronously
              if (mounted()) Navigator.pop(context, true);
            })
      ],
    );
  }
}
