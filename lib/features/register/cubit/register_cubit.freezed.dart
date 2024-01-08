// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$RegisterState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int newTabIndex) tabIndexUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int newTabIndex)? tabIndexUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int newTabIndex)? tabIndexUpdated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(TabIndexUpdated value) tabIndexUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(TabIndexUpdated value)? tabIndexUpdated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(TabIndexUpdated value)? tabIndexUpdated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterStateCopyWith<$Res> {
  factory $RegisterStateCopyWith(
          RegisterState value, $Res Function(RegisterState) then) =
      _$RegisterStateCopyWithImpl<$Res, RegisterState>;
}

/// @nodoc
class _$RegisterStateCopyWithImpl<$Res, $Val extends RegisterState>
    implements $RegisterStateCopyWith<$Res> {
  _$RegisterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'RegisterState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int newTabIndex) tabIndexUpdated,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int newTabIndex)? tabIndexUpdated,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int newTabIndex)? tabIndexUpdated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(TabIndexUpdated value) tabIndexUpdated,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(TabIndexUpdated value)? tabIndexUpdated,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(TabIndexUpdated value)? tabIndexUpdated,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements RegisterState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$TabIndexUpdatedImplCopyWith<$Res> {
  factory _$$TabIndexUpdatedImplCopyWith(_$TabIndexUpdatedImpl value,
          $Res Function(_$TabIndexUpdatedImpl) then) =
      __$$TabIndexUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int newTabIndex});
}

/// @nodoc
class __$$TabIndexUpdatedImplCopyWithImpl<$Res>
    extends _$RegisterStateCopyWithImpl<$Res, _$TabIndexUpdatedImpl>
    implements _$$TabIndexUpdatedImplCopyWith<$Res> {
  __$$TabIndexUpdatedImplCopyWithImpl(
      _$TabIndexUpdatedImpl _value, $Res Function(_$TabIndexUpdatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? newTabIndex = null,
  }) {
    return _then(_$TabIndexUpdatedImpl(
      newTabIndex: null == newTabIndex
          ? _value.newTabIndex
          : newTabIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$TabIndexUpdatedImpl implements TabIndexUpdated {
  const _$TabIndexUpdatedImpl({required this.newTabIndex});

  @override
  final int newTabIndex;

  @override
  String toString() {
    return 'RegisterState.tabIndexUpdated(newTabIndex: $newTabIndex)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$TabIndexUpdatedImpl &&
            (identical(other.newTabIndex, newTabIndex) ||
                other.newTabIndex == newTabIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, newTabIndex);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$TabIndexUpdatedImplCopyWith<_$TabIndexUpdatedImpl> get copyWith =>
      __$$TabIndexUpdatedImplCopyWithImpl<_$TabIndexUpdatedImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function(int newTabIndex) tabIndexUpdated,
  }) {
    return tabIndexUpdated(newTabIndex);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function(int newTabIndex)? tabIndexUpdated,
  }) {
    return tabIndexUpdated?.call(newTabIndex);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function(int newTabIndex)? tabIndexUpdated,
    required TResult orElse(),
  }) {
    if (tabIndexUpdated != null) {
      return tabIndexUpdated(newTabIndex);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(TabIndexUpdated value) tabIndexUpdated,
  }) {
    return tabIndexUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(TabIndexUpdated value)? tabIndexUpdated,
  }) {
    return tabIndexUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(TabIndexUpdated value)? tabIndexUpdated,
    required TResult orElse(),
  }) {
    if (tabIndexUpdated != null) {
      return tabIndexUpdated(this);
    }
    return orElse();
  }
}

abstract class TabIndexUpdated implements RegisterState {
  const factory TabIndexUpdated({required final int newTabIndex}) =
      _$TabIndexUpdatedImpl;

  int get newTabIndex;
  @JsonKey(ignore: true)
  _$$TabIndexUpdatedImplCopyWith<_$TabIndexUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
