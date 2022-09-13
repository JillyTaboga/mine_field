import 'package:fluent_ui/fluent_ui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mine_field/interface/screen/panes/game/game_controller.dart';

class GameHeader extends HookConsumerWidget {
  const GameHeader({
    Key? key,
    required this.status,
    required this.counter,
  }) : super(key: key);

  final GameStatus status;
  final int counter;

  @override
  Widget build(BuildContext context, ref) {
    return Row(
      children: [
        if (status == GameStatus.running)
          Button(
            child: const Text('Pause'),
            onPressed: () {
              ref.read(gameStatusProvider.notifier).state = GameStatus.paused;
            },
          ),
        if (status == GameStatus.paused)
          FilledButton(
            child: const Text('Jogar'),
            onPressed: () {
              ref.read(gameStatusProvider.notifier).state = GameStatus.running;
            },
          ),
        Expanded(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(FluentIcons.clock),
              Text(counter.toString()),
            ],
          ),
        ),
        Button(
          child: const Text('Reiniciar'),
          onPressed: () {
            ref.read(gameProvider.notifier).newGame();
          },
        ),
      ],
    );
  }
}
