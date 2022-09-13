import 'package:fluent_ui/fluent_ui.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mine_field/interface/screen/panes/game/game_pane.dart';
import 'package:mine_field/interface/screen/panes/settings/settings_pane.dart';

final navigatorProvider = StateProvider<Panes>((ref) {
  return Panes.game;
});

final navigatorIndexProvider = Provider<int>((ref) {
  final currentPane = ref.watch(navigatorProvider);
  return Panes.values.indexOf(currentPane);
});

enum Panes {
  game(GamePane()),
  settings(SettingsPane());

  final Widget child;
  const Panes(this.child);
}
