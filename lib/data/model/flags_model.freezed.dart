// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'flags_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FlagsModel _$FlagsModelFromJson(Map<String, dynamic> json) {
  return _FlagsModel.fromJson(json);
}

/// @nodoc
class _$FlagsModelTearOff {
  const _$FlagsModelTearOff();

  _FlagsModel call(
      {bool? nsfw,
      bool? religious,
      bool? political,
      bool? racist,
      bool? sexist,
      bool? explicit}) {
    return _FlagsModel(
      nsfw: nsfw,
      religious: religious,
      political: political,
      racist: racist,
      sexist: sexist,
      explicit: explicit,
    );
  }

  FlagsModel fromJson(Map<String, Object?> json) {
    return FlagsModel.fromJson(json);
  }
}

/// @nodoc
const $FlagsModel = _$FlagsModelTearOff();

/// @nodoc
mixin _$FlagsModel {
  bool? get nsfw => throw _privateConstructorUsedError;
  bool? get religious => throw _privateConstructorUsedError;
  bool? get political => throw _privateConstructorUsedError;
  bool? get racist => throw _privateConstructorUsedError;
  bool? get sexist => throw _privateConstructorUsedError;
  bool? get explicit => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FlagsModelCopyWith<FlagsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FlagsModelCopyWith<$Res> {
  factory $FlagsModelCopyWith(
          FlagsModel value, $Res Function(FlagsModel) then) =
      _$FlagsModelCopyWithImpl<$Res>;
  $Res call(
      {bool? nsfw,
      bool? religious,
      bool? political,
      bool? racist,
      bool? sexist,
      bool? explicit});
}

/// @nodoc
class _$FlagsModelCopyWithImpl<$Res> implements $FlagsModelCopyWith<$Res> {
  _$FlagsModelCopyWithImpl(this._value, this._then);

  final FlagsModel _value;
  // ignore: unused_field
  final $Res Function(FlagsModel) _then;

  @override
  $Res call({
    Object? nsfw = freezed,
    Object? religious = freezed,
    Object? political = freezed,
    Object? racist = freezed,
    Object? sexist = freezed,
    Object? explicit = freezed,
  }) {
    return _then(_value.copyWith(
      nsfw: nsfw == freezed
          ? _value.nsfw
          : nsfw // ignore: cast_nullable_to_non_nullable
              as bool?,
      religious: religious == freezed
          ? _value.religious
          : religious // ignore: cast_nullable_to_non_nullable
              as bool?,
      political: political == freezed
          ? _value.political
          : political // ignore: cast_nullable_to_non_nullable
              as bool?,
      racist: racist == freezed
          ? _value.racist
          : racist // ignore: cast_nullable_to_non_nullable
              as bool?,
      sexist: sexist == freezed
          ? _value.sexist
          : sexist // ignore: cast_nullable_to_non_nullable
              as bool?,
      explicit: explicit == freezed
          ? _value.explicit
          : explicit // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
abstract class _$FlagsModelCopyWith<$Res> implements $FlagsModelCopyWith<$Res> {
  factory _$FlagsModelCopyWith(
          _FlagsModel value, $Res Function(_FlagsModel) then) =
      __$FlagsModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool? nsfw,
      bool? religious,
      bool? political,
      bool? racist,
      bool? sexist,
      bool? explicit});
}

/// @nodoc
class __$FlagsModelCopyWithImpl<$Res> extends _$FlagsModelCopyWithImpl<$Res>
    implements _$FlagsModelCopyWith<$Res> {
  __$FlagsModelCopyWithImpl(
      _FlagsModel _value, $Res Function(_FlagsModel) _then)
      : super(_value, (v) => _then(v as _FlagsModel));

  @override
  _FlagsModel get _value => super._value as _FlagsModel;

  @override
  $Res call({
    Object? nsfw = freezed,
    Object? religious = freezed,
    Object? political = freezed,
    Object? racist = freezed,
    Object? sexist = freezed,
    Object? explicit = freezed,
  }) {
    return _then(_FlagsModel(
      nsfw: nsfw == freezed
          ? _value.nsfw
          : nsfw // ignore: cast_nullable_to_non_nullable
              as bool?,
      religious: religious == freezed
          ? _value.religious
          : religious // ignore: cast_nullable_to_non_nullable
              as bool?,
      political: political == freezed
          ? _value.political
          : political // ignore: cast_nullable_to_non_nullable
              as bool?,
      racist: racist == freezed
          ? _value.racist
          : racist // ignore: cast_nullable_to_non_nullable
              as bool?,
      sexist: sexist == freezed
          ? _value.sexist
          : sexist // ignore: cast_nullable_to_non_nullable
              as bool?,
      explicit: explicit == freezed
          ? _value.explicit
          : explicit // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FlagsModel with DiagnosticableTreeMixin implements _FlagsModel {
  const _$_FlagsModel(
      {this.nsfw,
      this.religious,
      this.political,
      this.racist,
      this.sexist,
      this.explicit});

  factory _$_FlagsModel.fromJson(Map<String, dynamic> json) =>
      _$$_FlagsModelFromJson(json);

  @override
  final bool? nsfw;
  @override
  final bool? religious;
  @override
  final bool? political;
  @override
  final bool? racist;
  @override
  final bool? sexist;
  @override
  final bool? explicit;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'FlagsModel(nsfw: $nsfw, religious: $religious, political: $political, racist: $racist, sexist: $sexist, explicit: $explicit)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'FlagsModel'))
      ..add(DiagnosticsProperty('nsfw', nsfw))
      ..add(DiagnosticsProperty('religious', religious))
      ..add(DiagnosticsProperty('political', political))
      ..add(DiagnosticsProperty('racist', racist))
      ..add(DiagnosticsProperty('sexist', sexist))
      ..add(DiagnosticsProperty('explicit', explicit));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FlagsModel &&
            const DeepCollectionEquality().equals(other.nsfw, nsfw) &&
            const DeepCollectionEquality().equals(other.religious, religious) &&
            const DeepCollectionEquality().equals(other.political, political) &&
            const DeepCollectionEquality().equals(other.racist, racist) &&
            const DeepCollectionEquality().equals(other.sexist, sexist) &&
            const DeepCollectionEquality().equals(other.explicit, explicit));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(nsfw),
      const DeepCollectionEquality().hash(religious),
      const DeepCollectionEquality().hash(political),
      const DeepCollectionEquality().hash(racist),
      const DeepCollectionEquality().hash(sexist),
      const DeepCollectionEquality().hash(explicit));

  @JsonKey(ignore: true)
  @override
  _$FlagsModelCopyWith<_FlagsModel> get copyWith =>
      __$FlagsModelCopyWithImpl<_FlagsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FlagsModelToJson(this);
  }
}

abstract class _FlagsModel implements FlagsModel {
  const factory _FlagsModel(
      {bool? nsfw,
      bool? religious,
      bool? political,
      bool? racist,
      bool? sexist,
      bool? explicit}) = _$_FlagsModel;

  factory _FlagsModel.fromJson(Map<String, dynamic> json) =
      _$_FlagsModel.fromJson;

  @override
  bool? get nsfw;
  @override
  bool? get religious;
  @override
  bool? get political;
  @override
  bool? get racist;
  @override
  bool? get sexist;
  @override
  bool? get explicit;
  @override
  @JsonKey(ignore: true)
  _$FlagsModelCopyWith<_FlagsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
