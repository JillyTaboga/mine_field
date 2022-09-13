import 'package:fluent_ui/fluent_ui.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_entity.freezed.dart';

@freezed
class GameEntity with _$GameEntity {
  const factory GameEntity({
    @Default([]) List<GameCell> cells,
  }) = _GameEntity;
}

@freezed
class GameCell with _$GameCell {
  const factory GameCell({
    required int row,
    required int column,
    @Default(false) hasBomb,
    @Default(false) clicked,
    Flag? flag,
  }) = _GameCell;
}

extension GameStatistics on GameEntity {
  int get remainingBombs {
    int value = 0;
    for (final cell in cells) {
      if (cell.hasBomb && !cell.clicked) {
        value++;
      }
    }
    return value;
  }

  int get remainingCells {
    int value = 0;
    for (final cell in cells) {
      if (!cell.clicked) {
        value++;
      }
    }
    return value;
  }
}

extension GameCheck on GameCell {
  int numberOfNeighbor(GameEntity game) {
    int value = 0;
    for (final cell in game.cells) {
      final checkRow =
          (cell.row == row || cell.row == row + 1 || cell.row == row - 1);
      final checkColumn = (cell.column == column ||
          cell.column == column + 1 ||
          cell.column == column - 1);
      final checkBomb = cell.hasBomb;
      if (checkRow && checkColumn && checkBomb) {
        value++;
      }
    }
    return value;
  }

  bool isNeighbor(GameCell otherCell) {
    final isInRowRange = otherCell.row <= row + 1 && otherCell.row >= row - 1;
    final isInColumnRange =
        otherCell.column <= column + 1 && otherCell.column >= column - 1;
    return isInRowRange && isInColumnRange;
  }

  bool hasNeighborClicked(GameEntity game) {
    for (final cell in game.cells) {
      final isNeighbor = cell.isNeighbor(this);
      if (isNeighbor && cell.clicked) {
        return true;
      }
    }
    return false;
  }

  List<GameCell> getNeighbors(GameEntity game) {
    List<GameCell> neighbors = [];
    for (final cell in game.cells) {
      if (cell.isNeighbor(this)) {
        neighbors.add(cell);
      }
    }
    return neighbors;
  }
}

extension ListGameCell on List<GameCell> {
  GameCell? byRowAndColumn({
    required int row,
    required int column,
  }) {
    for (final cell in this) {
      if (cell.row == row && cell.column == column) {
        return cell;
      }
    }
    return null;
  }
}

enum Flag {
  hasBomb(
    FluentIcons.flag,
  ),
  notSure(
    FluentIcons.warning,
  );

  final IconData icon;
  const Flag(
    this.icon,
  );
}
