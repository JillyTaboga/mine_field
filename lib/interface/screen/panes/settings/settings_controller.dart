import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mine_field/interface/screen/panes/game/game_controller.dart';

final dificultValueProvider = StateProvider<double>((ref) {
  return 2;
});

final dificultProvider = Provider<GameDificult>((ref) {
  final value = ref.watch(dificultValueProvider).floor();
  return GameDificult.values[value];
});

final dificultLabelProvider = Provider<String>((ref) {
  final currentDificult = ref.watch(dificultProvider);
  return '${currentDificult.label} ${currentDificult.size}x${currentDificult.size}';
});
