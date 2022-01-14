// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'joke_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

JokeModel _$JokeModelFromJson(Map<String, dynamic> json) {
  return _JokeModel.fromJson(json);
}

/// @nodoc
class _$JokeModelTearOff {
  const _$JokeModelTearOff();

  _JokeModel call(
      {required bool safe,
      String? category,
      String? delivery,
      FlagsModel? flags,
      int? id,
      String? lang,
      String? setup,
      String? type}) {
    return _JokeModel(
      safe: safe,
      category: category,
      delivery: delivery,
      flags: flags,
      id: id,
      lang: lang,
      setup: setup,
      type: type,
    );
  }

  JokeModel fromJson(Map<String, Object?> json) {
    return JokeModel.fromJson(json);
  }
}

/// @nodoc
const $JokeModel = _$JokeModelTearOff();

/// @nodoc
mixin _$JokeModel {
  bool get safe => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;
  String? get delivery => throw _privateConstructorUsedError;
  FlagsModel? get flags => throw _privateConstructorUsedError;
  int? get id => throw _privateConstructorUsedError;
  String? get lang => throw _privateConstructorUsedError;
  String? get setup => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $JokeModelCopyWith<JokeModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $JokeModelCopyWith<$Res> {
  factory $JokeModelCopyWith(JokeModel value, $Res Function(JokeModel) then) =
      _$JokeModelCopyWithImpl<$Res>;
  $Res call(
      {bool safe,
      String? category,
      String? delivery,
      FlagsModel? flags,
      int? id,
      String? lang,
      String? setup,
      String? type});

  $FlagsModelCopyWith<$Res>? get flags;
}

/// @nodoc
class _$JokeModelCopyWithImpl<$Res> implements $JokeModelCopyWith<$Res> {
  _$JokeModelCopyWithImpl(this._value, this._then);

  final JokeModel _value;
  // ignore: unused_field
  final $Res Function(JokeModel) _then;

  @override
  $Res call({
    Object? safe = freezed,
    Object? category = freezed,
    Object? delivery = freezed,
    Object? flags = freezed,
    Object? id = freezed,
    Object? lang = freezed,
    Object? setup = freezed,
    Object? type = freezed,
  }) {
    return _then(_value.copyWith(
      safe: safe == freezed
          ? _value.safe
          : safe // ignore: cast_nullable_to_non_nullable
              as bool,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      delivery: delivery == freezed
          ? _value.delivery
          : delivery // ignore: cast_nullable_to_non_nullable
              as String?,
      flags: flags == freezed
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as FlagsModel?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      lang: lang == freezed
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String?,
      setup: setup == freezed
          ? _value.setup
          : setup // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }

  @override
  $FlagsModelCopyWith<$Res>? get flags {
    if (_value.flags == null) {
      return null;
    }

    return $FlagsModelCopyWith<$Res>(_value.flags!, (value) {
      return _then(_value.copyWith(flags: value));
    });
  }
}

/// @nodoc
abstract class _$JokeModelCopyWith<$Res> implements $JokeModelCopyWith<$Res> {
  factory _$JokeModelCopyWith(
          _JokeModel value, $Res Function(_JokeModel) then) =
      __$JokeModelCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool safe,
      String? category,
      String? delivery,
      FlagsModel? flags,
      int? id,
      String? lang,
      String? setup,
      String? type});

  @override
  $FlagsModelCopyWith<$Res>? get flags;
}

/// @nodoc
class __$JokeModelCopyWithImpl<$Res> extends _$JokeModelCopyWithImpl<$Res>
    implements _$JokeModelCopyWith<$Res> {
  __$JokeModelCopyWithImpl(_JokeModel _value, $Res Function(_JokeModel) _then)
      : super(_value, (v) => _then(v as _JokeModel));

  @override
  _JokeModel get _value => super._value as _JokeModel;

  @override
  $Res call({
    Object? safe = freezed,
    Object? category = freezed,
    Object? delivery = freezed,
    Object? flags = freezed,
    Object? id = freezed,
    Object? lang = freezed,
    Object? setup = freezed,
    Object? type = freezed,
  }) {
    return _then(_JokeModel(
      safe: safe == freezed
          ? _value.safe
          : safe // ignore: cast_nullable_to_non_nullable
              as bool,
      category: category == freezed
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
      delivery: delivery == freezed
          ? _value.delivery
          : delivery // ignore: cast_nullable_to_non_nullable
              as String?,
      flags: flags == freezed
          ? _value.flags
          : flags // ignore: cast_nullable_to_non_nullable
              as FlagsModel?,
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      lang: lang == freezed
          ? _value.lang
          : lang // ignore: cast_nullable_to_non_nullable
              as String?,
      setup: setup == freezed
          ? _value.setup
          : setup // ignore: cast_nullable_to_non_nullable
              as String?,
      type: type == freezed
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_JokeModel with DiagnosticableTreeMixin implements _JokeModel {
  const _$_JokeModel(
      {required this.safe,
      this.category,
      this.delivery,
      this.flags,
      this.id,
      this.lang,
      this.setup,
      this.type});

  factory _$_JokeModel.fromJson(Map<String, dynamic> json) =>
      _$$_JokeModelFromJson(json);

  @override
  final bool safe;
  @override
  final String? category;
  @override
  final String? delivery;
  @override
  final FlagsModel? flags;
  @override
  final int? id;
  @override
  final String? lang;
  @override
  final String? setup;
  @override
  final String? type;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'JokeModel(safe: $safe, category: $category, delivery: $delivery, flags: $flags, id: $id, lang: $lang, setup: $setup, type: $type)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'JokeModel'))
      ..add(DiagnosticsProperty('safe', safe))
      ..add(DiagnosticsProperty('category', category))
      ..add(DiagnosticsProperty('delivery', delivery))
      ..add(DiagnosticsProperty('flags', flags))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('lang', lang))
      ..add(DiagnosticsProperty('setup', setup))
      ..add(DiagnosticsProperty('type', type));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _JokeModel &&
            const DeepCollectionEquality().equals(other.safe, safe) &&
            const DeepCollectionEquality().equals(other.category, category) &&
            const DeepCollectionEquality().equals(other.delivery, delivery) &&
            const DeepCollectionEquality().equals(other.flags, flags) &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.lang, lang) &&
            const DeepCollectionEquality().equals(other.setup, setup) &&
            const DeepCollectionEquality().equals(other.type, type));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(safe),
      const DeepCollectionEquality().hash(category),
      const DeepCollectionEquality().hash(delivery),
      const DeepCollectionEquality().hash(flags),
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(lang),
      const DeepCollectionEquality().hash(setup),
      const DeepCollectionEquality().hash(type));

  @JsonKey(ignore: true)
  @override
  _$JokeModelCopyWith<_JokeModel> get copyWith =>
      __$JokeModelCopyWithImpl<_JokeModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_JokeModelToJson(this);
  }
}

abstract class _JokeModel implements JokeModel {
  const factory _JokeModel(
      {required bool safe,
      String? category,
      String? delivery,
      FlagsModel? flags,
      int? id,
      String? lang,
      String? setup,
      String? type}) = _$_JokeModel;

  factory _JokeModel.fromJson(Map<String, dynamic> json) =
      _$_JokeModel.fromJson;

  @override
  bool get safe;
  @override
  String? get category;
  @override
  String? get delivery;
  @override
  FlagsModel? get flags;
  @override
  int? get id;
  @override
  String? get lang;
  @override
  String? get setup;
  @override
  String? get type;
  @override
  @JsonKey(ignore: true)
  _$JokeModelCopyWith<_JokeModel> get copyWith =>
      throw _privateConstructorUsedError;
}
