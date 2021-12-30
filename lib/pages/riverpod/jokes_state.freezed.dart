// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'jokes_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$JokesStateTearOff {
  const _$JokesStateTearOff();

  _JokesStateInitial initial() {
    return const _JokesStateInitial();
  }

  _JokesStateLoading loading() {
    return const _JokesStateLoading();
  }

  _JokesStateData data({required JokeModel joke}) {
    return _JokesStateData(
      joke: joke,
    );
  }

  _JokesStateError error([String? error]) {
    return _JokesStateError(
      error,
    );
  }
}

/// @nodoc
const $JokesState = _$JokesStateTearOff();

/// @nodoc
mixin _$JokesState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(JokeModel joke) data,
    required TResult Function(String? error) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(JokeModel joke)? data,
    TResult Function(String? error)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(JokeModel joke)? data,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JokesStateInitial value) initial,
    required TResult Function(_JokesStateLoading value) loading,
    required TResult Function(_JokesStateData value) data,
    required TResult Function(_JokesStateError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_JokesStateInitial value)? initial,
    TResult Function(_JokesStateLoading value)? loading,
    TResult Function(_JokesStateData value)? data,
    TResult Function(_JokesStateError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JokesStateInitial value)? initial,
    TResult Function(_JokesStateLoading value)? loading,
    TResult Function(_JokesStateData value)? data,
    TResult Function(_JokesStateError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JokesStateCopyWith<$Res> {
  factory $JokesStateCopyWith(
          JokesState value, $Res Function(JokesState) then) =
      _$JokesStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$JokesStateCopyWithImpl<$Res> implements $JokesStateCopyWith<$Res> {
  _$JokesStateCopyWithImpl(this._value, this._then);

  final JokesState _value;
  // ignore: unused_field
  final $Res Function(JokesState) _then;
}

/// @nodoc
abstract class _$JokesStateInitialCopyWith<$Res> {
  factory _$JokesStateInitialCopyWith(
          _JokesStateInitial value, $Res Function(_JokesStateInitial) then) =
      __$JokesStateInitialCopyWithImpl<$Res>;
}

/// @nodoc
class __$JokesStateInitialCopyWithImpl<$Res>
    extends _$JokesStateCopyWithImpl<$Res>
    implements _$JokesStateInitialCopyWith<$Res> {
  __$JokesStateInitialCopyWithImpl(
      _JokesStateInitial _value, $Res Function(_JokesStateInitial) _then)
      : super(_value, (v) => _then(v as _JokesStateInitial));

  @override
  _JokesStateInitial get _value => super._value as _JokesStateInitial;
}

/// @nodoc

class _$_JokesStateInitial
    with DiagnosticableTreeMixin
    implements _JokesStateInitial {
  const _$_JokesStateInitial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'JokesState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'JokesState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _JokesStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(JokeModel joke) data,
    required TResult Function(String? error) error,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(JokeModel joke)? data,
    TResult Function(String? error)? error,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(JokeModel joke)? data,
    TResult Function(String? error)? error,
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
    required TResult Function(_JokesStateInitial value) initial,
    required TResult Function(_JokesStateLoading value) loading,
    required TResult Function(_JokesStateData value) data,
    required TResult Function(_JokesStateError value) error,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_JokesStateInitial value)? initial,
    TResult Function(_JokesStateLoading value)? loading,
    TResult Function(_JokesStateData value)? data,
    TResult Function(_JokesStateError value)? error,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JokesStateInitial value)? initial,
    TResult Function(_JokesStateLoading value)? loading,
    TResult Function(_JokesStateData value)? data,
    TResult Function(_JokesStateError value)? error,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _JokesStateInitial implements JokesState {
  const factory _JokesStateInitial() = _$_JokesStateInitial;
}

/// @nodoc
abstract class _$JokesStateLoadingCopyWith<$Res> {
  factory _$JokesStateLoadingCopyWith(
          _JokesStateLoading value, $Res Function(_JokesStateLoading) then) =
      __$JokesStateLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class __$JokesStateLoadingCopyWithImpl<$Res>
    extends _$JokesStateCopyWithImpl<$Res>
    implements _$JokesStateLoadingCopyWith<$Res> {
  __$JokesStateLoadingCopyWithImpl(
      _JokesStateLoading _value, $Res Function(_JokesStateLoading) _then)
      : super(_value, (v) => _then(v as _JokesStateLoading));

  @override
  _JokesStateLoading get _value => super._value as _JokesStateLoading;
}

/// @nodoc

class _$_JokesStateLoading
    with DiagnosticableTreeMixin
    implements _JokesStateLoading {
  const _$_JokesStateLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'JokesState.loading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'JokesState.loading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _JokesStateLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(JokeModel joke) data,
    required TResult Function(String? error) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(JokeModel joke)? data,
    TResult Function(String? error)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(JokeModel joke)? data,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JokesStateInitial value) initial,
    required TResult Function(_JokesStateLoading value) loading,
    required TResult Function(_JokesStateData value) data,
    required TResult Function(_JokesStateError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_JokesStateInitial value)? initial,
    TResult Function(_JokesStateLoading value)? loading,
    TResult Function(_JokesStateData value)? data,
    TResult Function(_JokesStateError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JokesStateInitial value)? initial,
    TResult Function(_JokesStateLoading value)? loading,
    TResult Function(_JokesStateData value)? data,
    TResult Function(_JokesStateError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class _JokesStateLoading implements JokesState {
  const factory _JokesStateLoading() = _$_JokesStateLoading;
}

/// @nodoc
abstract class _$JokesStateDataCopyWith<$Res> {
  factory _$JokesStateDataCopyWith(
          _JokesStateData value, $Res Function(_JokesStateData) then) =
      __$JokesStateDataCopyWithImpl<$Res>;
  $Res call({JokeModel joke});

  $JokeModelCopyWith<$Res> get joke;
}

/// @nodoc
class __$JokesStateDataCopyWithImpl<$Res> extends _$JokesStateCopyWithImpl<$Res>
    implements _$JokesStateDataCopyWith<$Res> {
  __$JokesStateDataCopyWithImpl(
      _JokesStateData _value, $Res Function(_JokesStateData) _then)
      : super(_value, (v) => _then(v as _JokesStateData));

  @override
  _JokesStateData get _value => super._value as _JokesStateData;

  @override
  $Res call({
    Object? joke = freezed,
  }) {
    return _then(_JokesStateData(
      joke: joke == freezed
          ? _value.joke
          : joke // ignore: cast_nullable_to_non_nullable
              as JokeModel,
    ));
  }

  @override
  $JokeModelCopyWith<$Res> get joke {
    return $JokeModelCopyWith<$Res>(_value.joke, (value) {
      return _then(_value.copyWith(joke: value));
    });
  }
}

/// @nodoc

class _$_JokesStateData
    with DiagnosticableTreeMixin
    implements _JokesStateData {
  const _$_JokesStateData({required this.joke});

  @override
  final JokeModel joke;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'JokesState.data(joke: $joke)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'JokesState.data'))
      ..add(DiagnosticsProperty('joke', joke));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _JokesStateData &&
            const DeepCollectionEquality().equals(other.joke, joke));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(joke));

  @JsonKey(ignore: true)
  @override
  _$JokesStateDataCopyWith<_JokesStateData> get copyWith =>
      __$JokesStateDataCopyWithImpl<_JokesStateData>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(JokeModel joke) data,
    required TResult Function(String? error) error,
  }) {
    return data(joke);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(JokeModel joke)? data,
    TResult Function(String? error)? error,
  }) {
    return data?.call(joke);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(JokeModel joke)? data,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(joke);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JokesStateInitial value) initial,
    required TResult Function(_JokesStateLoading value) loading,
    required TResult Function(_JokesStateData value) data,
    required TResult Function(_JokesStateError value) error,
  }) {
    return data(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_JokesStateInitial value)? initial,
    TResult Function(_JokesStateLoading value)? loading,
    TResult Function(_JokesStateData value)? data,
    TResult Function(_JokesStateError value)? error,
  }) {
    return data?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JokesStateInitial value)? initial,
    TResult Function(_JokesStateLoading value)? loading,
    TResult Function(_JokesStateData value)? data,
    TResult Function(_JokesStateError value)? error,
    required TResult orElse(),
  }) {
    if (data != null) {
      return data(this);
    }
    return orElse();
  }
}

abstract class _JokesStateData implements JokesState {
  const factory _JokesStateData({required JokeModel joke}) = _$_JokesStateData;

  JokeModel get joke;
  @JsonKey(ignore: true)
  _$JokesStateDataCopyWith<_JokesStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$JokesStateErrorCopyWith<$Res> {
  factory _$JokesStateErrorCopyWith(
          _JokesStateError value, $Res Function(_JokesStateError) then) =
      __$JokesStateErrorCopyWithImpl<$Res>;
  $Res call({String? error});
}

/// @nodoc
class __$JokesStateErrorCopyWithImpl<$Res>
    extends _$JokesStateCopyWithImpl<$Res>
    implements _$JokesStateErrorCopyWith<$Res> {
  __$JokesStateErrorCopyWithImpl(
      _JokesStateError _value, $Res Function(_JokesStateError) _then)
      : super(_value, (v) => _then(v as _JokesStateError));

  @override
  _JokesStateError get _value => super._value as _JokesStateError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(_JokesStateError(
      error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_JokesStateError
    with DiagnosticableTreeMixin
    implements _JokesStateError {
  const _$_JokesStateError([this.error]);

  @override
  final String? error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'JokesState.error(error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'JokesState.error'))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _JokesStateError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  _$JokesStateErrorCopyWith<_JokesStateError> get copyWith =>
      __$JokesStateErrorCopyWithImpl<_JokesStateError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(JokeModel joke) data,
    required TResult Function(String? error) error,
  }) {
    return error(this.error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(JokeModel joke)? data,
    TResult Function(String? error)? error,
  }) {
    return error?.call(this.error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(JokeModel joke)? data,
    TResult Function(String? error)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this.error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_JokesStateInitial value) initial,
    required TResult Function(_JokesStateLoading value) loading,
    required TResult Function(_JokesStateData value) data,
    required TResult Function(_JokesStateError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_JokesStateInitial value)? initial,
    TResult Function(_JokesStateLoading value)? loading,
    TResult Function(_JokesStateData value)? data,
    TResult Function(_JokesStateError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_JokesStateInitial value)? initial,
    TResult Function(_JokesStateLoading value)? loading,
    TResult Function(_JokesStateData value)? data,
    TResult Function(_JokesStateError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class _JokesStateError implements JokesState {
  const factory _JokesStateError([String? error]) = _$_JokesStateError;

  String? get error;
  @JsonKey(ignore: true)
  _$JokesStateErrorCopyWith<_JokesStateError> get copyWith =>
      throw _privateConstructorUsedError;
}
