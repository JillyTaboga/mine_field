import 'package:fluent_ui/fluent_ui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'navigator_controller.dart';
import 'panes/game/game_controller.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPaneIndex = ref.watch(navigatorIndexProvider);
    return NavigationView(
      appBar: NavigationAppBar(
        title: Center(
          child: Text(
            'Campo minado',
            style: FluentTheme.of(context).typography.title,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      pane: NavigationPane(
        selected: currentPaneIndex,
        displayMode: PaneDisplayMode.auto,
        header: Center(
          child: Text(
            'Menu',
            style: FluentTheme.of(context).typography.subtitle,
          ),
        ),
        onChanged: (value) {
          ref.read(navigatorProvider.notifier).state = Panes.values[value];
          if (value != 0) {
            ref.read(gameStatusProvider.notifier).state = GameStatus.paused;
          } else {
            ref.read(gameStatusProvider.notifier).state = GameStatus.running;
          }
        },
        items: [
          PaneItem(
            icon: const Icon(FluentIcons.game),
            title: const Text('Jogo'),
            body: Panes.game.child,
          ),
          PaneItem(
            icon: const Icon(FluentIcons.settings),
            title: const Text('Configurações'),
            body: Panes.settings.child,
          ),
        ],
      ),
    );
  }
}
