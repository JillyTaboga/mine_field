import 'dart:async';
import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../domain/entities/game_entity.dart';
import '../settings/settings_controller.dart';

final gameProvider = StateNotifierProvider<GameNotifier, GameEntity>((ref) {
  final dificult = ref.watch(dificultProvider);
  return GameNotifier(
    dificult: dificult,
    ref: ref,
  );
});

class GameNotifier extends StateNotifier<GameEntity> {
  GameNotifier({
    required this.dificult,
    required this.ref,
  }) : super(const GameEntity()) {
    _generateGame();
  }

  final GameDificult dificult;
  final Ref ref;

  onClick({
    required int row,
    required int column,
  }) {
    final cell = state.cells.byRowAndColumn(row: row, column: column);
    if (cell == null) return;
    _updateCell(cell.copyWith(clicked: true));
    if (cell.hasBomb) {
      ref.read(gameStatusProvider.notifier).state = GameStatus.lost;
    } else {
      _checkWon();
    }
    _checkNeighbors(cell);
  }

  _checkNeighbors(GameCell clickedCell) {
    for (final neighborCells in clickedCell.getNeighbors(state)) {
      if (neighborCells.numberOfNeighbor(state) == 0 &&
          !neighborCells.clicked) {
        for (final toClickNeighbor in neighborCells.getNeighbors(state)) {
          if (!toClickNeighbor.clicked) {
            onClick(row: toClickNeighbor.row, column: toClickNeighbor.column);
          }
        }
      }
    }
  }

  _updateCell(GameCell newCell) {
    final cell =
        state.cells.byRowAndColumn(row: newCell.row, column: newCell.column);
    var list = [...state.cells];
    list.remove(cell);
    list.add(newCell);
    state = state.copyWith(cells: list);
  }

  onRightClick({
    required int row,
    required int column,
  }) {
    final cell = state.cells.byRowAndColumn(row: row, column: column);
    if (cell == null) return;
    var newCell = cell;
    if (cell.flag == null) {
      newCell = cell.copyWith(flag: Flag.hasBomb);
    } else if (cell.flag == Flag.hasBomb) {
      newCell = cell.copyWith(flag: Flag.notSure);
    } else {
      newCell = cell.copyWith(flag: null);
    }
    _updateCell(newCell);
  }

  _generateGame() {
    List<GameCell> cells = [];
    final random = Random();
    for (int row = 0; row < dificult.size; row++) {
      for (int column = 0; column < dificult.size; column++) {
        cells.add(
          GameCell(
            row: row,
            column: column,
            hasBomb: random.nextInt(100) < 20,
          ),
        );
      }
    }
    state = GameEntity(
      cells: cells,
    );
  }

  newGame() {
    ref.read(gameStatusProvider.notifier).state = GameStatus.running;
    _generateGame();
    ref.read(timeProvider.notifier).resetClock();
  }

  _checkWon() {
    if (state.remainingBombs == state.remainingCells) {
      ref.read(gameStatusProvider.notifier).state = GameStatus.won;
    }
  }
}

enum GameDificult {
  superEasey(5, 'Muito Fácil'),
  easy(10, 'Fácil'),
  medium(25, 'Médio'),
  hard(35, 'Difícil'),
  superHard(50, 'Muito Difícil');

  final int size;
  final String label;
  const GameDificult(
    this.size,
    this.label,
  );
}

final gameStatusProvider = StateProvider<GameStatus>((ref) {
  return GameStatus.running;
});

enum GameStatus {
  running('Jogando'),
  won('Ganhou!'),
  lost('Perdeu!'),
  paused('Pausado');

  final String label;
  const GameStatus(this.label);
}

final timeProvider =
    StateNotifierProvider.autoDispose<TimerNotifier, int>((ref) {
  return TimerNotifier(ref);
});

class TimerNotifier extends StateNotifier<int> {
  TimerNotifier(this.ref) : super(0) {
    ticker = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (ref.read(gameStatusProvider) == GameStatus.running) {
        state++;
      }
    });
  }

  final Ref ref;

  late Timer ticker;

  resetClock() {
    ref.invalidateSelf();
  }

  @override
  void dispose() {
    ticker.cancel();
    super.dispose();
  }
}
