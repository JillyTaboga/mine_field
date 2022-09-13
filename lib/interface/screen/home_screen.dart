import 'package:fluent_ui/fluent_ui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mine_field/interface/screen/navigator_controller.dart';
import 'package:mine_field/interface/screen/panes/game/game_controller.dart';

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
      ),
      pane: NavigationPane(
        selected: currentPaneIndex,
        displayMode: PaneDisplayMode.auto,
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
          ),
          PaneItem(
            icon: const Icon(FluentIcons.settings),
            title: const Text('Configurações'),
          ),
        ],
      ),
      content: NavigationBody(
        index: currentPaneIndex,
        children: Panes.values.map((e) => e.child).toList(),
      ),
    );
  }
}
