// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rss_source_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RssSourceModel _$RssSourceModelFromJson(Map<String, dynamic> json) {
  return _RssSourceModel.fromJson(json);
}

/// @nodoc
class _$RssSourceModelTearOff {
  const _$RssSourceModelTearOff();

  _RssSourceModel call(
      {required String name, required String logo, required String url}) {
    return _RssSourceModel(
      name: name,
      logo: logo,
      url: url,
    );
  }

  RssSourceModel fromJson(Map<String, Object?> json) {
    return RssSourceModel.fromJson(json);
  }
}

/// @nodoc
const $RssSourceModel = _$RssSourceModelTearOff();

/// @nodoc
mixin _$RssSourceModel {
  String get name => throw _privateConstructorUsedError;
  String get logo => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RssSourceModelCopyWith<RssSourceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RssSourceModelCopyWith<$Res> {
  factory $RssSourceModelCopyWith(
          RssSourceModel value, $Res Function(RssSourceModel) then) =
      _$RssSourceModelCopyWithImpl<$Res>;
  $Res call({String name, String logo, String url});
}

/// @nodoc
class _$RssSourceModelCopyWithImpl<$Res>
    implements $RssSourceModelCopyWith<$Res> {
  _$RssSourceModelCopyWithImpl(this._value, this._then);

  final RssSourceModel _value;
  // ignore: unused_field
  final $Res Function(RssSourceModel) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? logo = freezed,
    Object? url = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logo: logo == freezed
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
abstract class _$RssSourceModelCopyWith<$Res>
    implements $RssSourceModelCopyWith<$Res> {
  factory _$RssSourceModelCopyWith(
          _RssSourceModel value, $Res Function(_RssSourceModel) then) =
      __$RssSourceModelCopyWithImpl<$Res>;
  @override
  $Res call({String name, String logo, String url});
}

/// @nodoc
class __$RssSourceModelCopyWithImpl<$Res>
    extends _$RssSourceModelCopyWithImpl<$Res>
    implements _$RssSourceModelCopyWith<$Res> {
  __$RssSourceModelCopyWithImpl(
      _RssSourceModel _value, $Res Function(_RssSourceModel) _then)
      : super(_value, (v) => _then(v as _RssSourceModel));

  @override
  _RssSourceModel get _value => super._value as _RssSourceModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? logo = freezed,
    Object? url = freezed,
  }) {
    return _then(_RssSourceModel(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      logo: logo == freezed
          ? _value.logo
          : logo // ignore: cast_nullable_to_non_nullable
              as String,
      url: url == freezed
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RssSourceModel
    with DiagnosticableTreeMixin
    implements _RssSourceModel {
  const _$_RssSourceModel(
      {required this.name, required this.logo, required this.url});

  factory _$_RssSourceModel.fromJson(Map<String, dynamic> json) =>
      _$$_RssSourceModelFromJson(json);

  @override
  final String name;
  @override
  final String logo;
  @override
  final String url;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RssSourceModel(name: $name, logo: $logo, url: $url)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RssSourceModel'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('logo', logo))
      ..add(DiagnosticsProperty('url', url));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RssSourceModel &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.logo, logo) &&
            const DeepCollectionEquality().equals(other.url, url));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(logo),
      const DeepCollectionEquality().hash(url));

  @JsonKey(ignore: true)
  @override
  _$RssSourceModelCopyWith<_RssSourceModel> get copyWith =>
      __$RssSourceModelCopyWithImpl<_RssSourceModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RssSourceModelToJson(this);
  }
}

abstract class _RssSourceModel implements RssSourceModel {
  const factory _RssSourceModel(
      {required String name,
      required String logo,
      required String url}) = _$_RssSourceModel;

  factory _RssSourceModel.fromJson(Map<String, dynamic> json) =
      _$_RssSourceModel.fromJson;

  @override
  String get name;
  @override
  String get logo;
  @override
  String get url;
  @override
  @JsonKey(ignore: true)
  _$RssSourceModelCopyWith<_RssSourceModel> get copyWith =>
      throw _privateConstructorUsedError;
}
