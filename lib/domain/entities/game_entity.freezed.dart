// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'game_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$GameEntity {
  List<GameCell> get cells => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameEntityCopyWith<GameEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameEntityCopyWith<$Res> {
  factory $GameEntityCopyWith(
          GameEntity value, $Res Function(GameEntity) then) =
      _$GameEntityCopyWithImpl<$Res>;
  $Res call({List<GameCell> cells});
}

/// @nodoc
class _$GameEntityCopyWithImpl<$Res> implements $GameEntityCopyWith<$Res> {
  _$GameEntityCopyWithImpl(this._value, this._then);

  final GameEntity _value;
  // ignore: unused_field
  final $Res Function(GameEntity) _then;

  @override
  $Res call({
    Object? cells = freezed,
  }) {
    return _then(_value.copyWith(
      cells: cells == freezed
          ? _value.cells
          : cells // ignore: cast_nullable_to_non_nullable
              as List<GameCell>,
    ));
  }
}

/// @nodoc
abstract class _$$_GameEntityCopyWith<$Res>
    implements $GameEntityCopyWith<$Res> {
  factory _$$_GameEntityCopyWith(
          _$_GameEntity value, $Res Function(_$_GameEntity) then) =
      __$$_GameEntityCopyWithImpl<$Res>;
  @override
  $Res call({List<GameCell> cells});
}

/// @nodoc
class __$$_GameEntityCopyWithImpl<$Res> extends _$GameEntityCopyWithImpl<$Res>
    implements _$$_GameEntityCopyWith<$Res> {
  __$$_GameEntityCopyWithImpl(
      _$_GameEntity _value, $Res Function(_$_GameEntity) _then)
      : super(_value, (v) => _then(v as _$_GameEntity));

  @override
  _$_GameEntity get _value => super._value as _$_GameEntity;

  @override
  $Res call({
    Object? cells = freezed,
  }) {
    return _then(_$_GameEntity(
      cells: cells == freezed
          ? _value._cells
          : cells // ignore: cast_nullable_to_non_nullable
              as List<GameCell>,
    ));
  }
}

/// @nodoc

class _$_GameEntity implements _GameEntity {
  const _$_GameEntity({final List<GameCell> cells = const []}) : _cells = cells;

  final List<GameCell> _cells;
  @override
  @JsonKey()
  List<GameCell> get cells {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_cells);
  }

  @override
  String toString() {
    return 'GameEntity(cells: $cells)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameEntity &&
            const DeepCollectionEquality().equals(other._cells, _cells));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_cells));

  @JsonKey(ignore: true)
  @override
  _$$_GameEntityCopyWith<_$_GameEntity> get copyWith =>
      __$$_GameEntityCopyWithImpl<_$_GameEntity>(this, _$identity);
}

abstract class _GameEntity implements GameEntity {
  const factory _GameEntity({final List<GameCell> cells}) = _$_GameEntity;

  @override
  List<GameCell> get cells;
  @override
  @JsonKey(ignore: true)
  _$$_GameEntityCopyWith<_$_GameEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$GameCell {
  int get row => throw _privateConstructorUsedError;
  int get column => throw _privateConstructorUsedError;
  dynamic get hasBomb => throw _privateConstructorUsedError;
  dynamic get clicked => throw _privateConstructorUsedError;
  Flag? get flag => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $GameCellCopyWith<GameCell> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameCellCopyWith<$Res> {
  factory $GameCellCopyWith(GameCell value, $Res Function(GameCell) then) =
      _$GameCellCopyWithImpl<$Res>;
  $Res call(
      {int row, int column, dynamic hasBomb, dynamic clicked, Flag? flag});
}

/// @nodoc
class _$GameCellCopyWithImpl<$Res> implements $GameCellCopyWith<$Res> {
  _$GameCellCopyWithImpl(this._value, this._then);

  final GameCell _value;
  // ignore: unused_field
  final $Res Function(GameCell) _then;

  @override
  $Res call({
    Object? row = freezed,
    Object? column = freezed,
    Object? hasBomb = freezed,
    Object? clicked = freezed,
    Object? flag = freezed,
  }) {
    return _then(_value.copyWith(
      row: row == freezed
          ? _value.row
          : row // ignore: cast_nullable_to_non_nullable
              as int,
      column: column == freezed
          ? _value.column
          : column // ignore: cast_nullable_to_non_nullable
              as int,
      hasBomb: hasBomb == freezed
          ? _value.hasBomb
          : hasBomb // ignore: cast_nullable_to_non_nullable
              as dynamic,
      clicked: clicked == freezed
          ? _value.clicked
          : clicked // ignore: cast_nullable_to_non_nullable
              as dynamic,
      flag: flag == freezed
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as Flag?,
    ));
  }
}

/// @nodoc
abstract class _$$_GameCellCopyWith<$Res> implements $GameCellCopyWith<$Res> {
  factory _$$_GameCellCopyWith(
          _$_GameCell value, $Res Function(_$_GameCell) then) =
      __$$_GameCellCopyWithImpl<$Res>;
  @override
  $Res call(
      {int row, int column, dynamic hasBomb, dynamic clicked, Flag? flag});
}

/// @nodoc
class __$$_GameCellCopyWithImpl<$Res> extends _$GameCellCopyWithImpl<$Res>
    implements _$$_GameCellCopyWith<$Res> {
  __$$_GameCellCopyWithImpl(
      _$_GameCell _value, $Res Function(_$_GameCell) _then)
      : super(_value, (v) => _then(v as _$_GameCell));

  @override
  _$_GameCell get _value => super._value as _$_GameCell;

  @override
  $Res call({
    Object? row = freezed,
    Object? column = freezed,
    Object? hasBomb = freezed,
    Object? clicked = freezed,
    Object? flag = freezed,
  }) {
    return _then(_$_GameCell(
      row: row == freezed
          ? _value.row
          : row // ignore: cast_nullable_to_non_nullable
              as int,
      column: column == freezed
          ? _value.column
          : column // ignore: cast_nullable_to_non_nullable
              as int,
      hasBomb: hasBomb == freezed ? _value.hasBomb : hasBomb,
      clicked: clicked == freezed ? _value.clicked : clicked,
      flag: flag == freezed
          ? _value.flag
          : flag // ignore: cast_nullable_to_non_nullable
              as Flag?,
    ));
  }
}

/// @nodoc

class _$_GameCell implements _GameCell {
  const _$_GameCell(
      {required this.row,
      required this.column,
      this.hasBomb = false,
      this.clicked = false,
      this.flag});

  @override
  final int row;
  @override
  final int column;
  @override
  @JsonKey()
  final dynamic hasBomb;
  @override
  @JsonKey()
  final dynamic clicked;
  @override
  final Flag? flag;

  @override
  String toString() {
    return 'GameCell(row: $row, column: $column, hasBomb: $hasBomb, clicked: $clicked, flag: $flag)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_GameCell &&
            const DeepCollectionEquality().equals(other.row, row) &&
            const DeepCollectionEquality().equals(other.column, column) &&
            const DeepCollectionEquality().equals(other.hasBomb, hasBomb) &&
            const DeepCollectionEquality().equals(other.clicked, clicked) &&
            const DeepCollectionEquality().equals(other.flag, flag));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(row),
      const DeepCollectionEquality().hash(column),
      const DeepCollectionEquality().hash(hasBomb),
      const DeepCollectionEquality().hash(clicked),
      const DeepCollectionEquality().hash(flag));

  @JsonKey(ignore: true)
  @override
  _$$_GameCellCopyWith<_$_GameCell> get copyWith =>
      __$$_GameCellCopyWithImpl<_$_GameCell>(this, _$identity);
}

abstract class _GameCell implements GameCell {
  const factory _GameCell(
      {required final int row,
      required final int column,
      final dynamic hasBomb,
      final dynamic clicked,
      final Flag? flag}) = _$_GameCell;

  @override
  int get row;
  @override
  int get column;
  @override
  dynamic get hasBomb;
  @override
  dynamic get clicked;
  @override
  Flag? get flag;
  @override
  @JsonKey(ignore: true)
  _$$_GameCellCopyWith<_$_GameCell> get copyWith =>
      throw _privateConstructorUsedError;
}
