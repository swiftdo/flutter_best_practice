// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'rss_sources_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RssSourcesModel _$RssSourcesModelFromJson(Map<String, dynamic> json) {
  return _RssSourcesModel.fromJson(json);
}

/// @nodoc
class _$RssSourcesModelTearOff {
  const _$RssSourcesModelTearOff();

  _RssSourcesModel call(
      {required String name, required List<RssSourceModel> links}) {
    return _RssSourcesModel(
      name: name,
      links: links,
    );
  }

  RssSourcesModel fromJson(Map<String, Object?> json) {
    return RssSourcesModel.fromJson(json);
  }
}

/// @nodoc
const $RssSourcesModel = _$RssSourcesModelTearOff();

/// @nodoc
mixin _$RssSourcesModel {
  String get name => throw _privateConstructorUsedError;
  List<RssSourceModel> get links => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RssSourcesModelCopyWith<RssSourcesModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RssSourcesModelCopyWith<$Res> {
  factory $RssSourcesModelCopyWith(
          RssSourcesModel value, $Res Function(RssSourcesModel) then) =
      _$RssSourcesModelCopyWithImpl<$Res>;
  $Res call({String name, List<RssSourceModel> links});
}

/// @nodoc
class _$RssSourcesModelCopyWithImpl<$Res>
    implements $RssSourcesModelCopyWith<$Res> {
  _$RssSourcesModelCopyWithImpl(this._value, this._then);

  final RssSourcesModel _value;
  // ignore: unused_field
  final $Res Function(RssSourcesModel) _then;

  @override
  $Res call({
    Object? name = freezed,
    Object? links = freezed,
  }) {
    return _then(_value.copyWith(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      links: links == freezed
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<RssSourceModel>,
    ));
  }
}

/// @nodoc
abstract class _$RssSourcesModelCopyWith<$Res>
    implements $RssSourcesModelCopyWith<$Res> {
  factory _$RssSourcesModelCopyWith(
          _RssSourcesModel value, $Res Function(_RssSourcesModel) then) =
      __$RssSourcesModelCopyWithImpl<$Res>;
  @override
  $Res call({String name, List<RssSourceModel> links});
}

/// @nodoc
class __$RssSourcesModelCopyWithImpl<$Res>
    extends _$RssSourcesModelCopyWithImpl<$Res>
    implements _$RssSourcesModelCopyWith<$Res> {
  __$RssSourcesModelCopyWithImpl(
      _RssSourcesModel _value, $Res Function(_RssSourcesModel) _then)
      : super(_value, (v) => _then(v as _RssSourcesModel));

  @override
  _RssSourcesModel get _value => super._value as _RssSourcesModel;

  @override
  $Res call({
    Object? name = freezed,
    Object? links = freezed,
  }) {
    return _then(_RssSourcesModel(
      name: name == freezed
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      links: links == freezed
          ? _value.links
          : links // ignore: cast_nullable_to_non_nullable
              as List<RssSourceModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RssSourcesModel
    with DiagnosticableTreeMixin
    implements _RssSourcesModel {
  const _$_RssSourcesModel({required this.name, required this.links});

  factory _$_RssSourcesModel.fromJson(Map<String, dynamic> json) =>
      _$$_RssSourcesModelFromJson(json);

  @override
  final String name;
  @override
  final List<RssSourceModel> links;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'RssSourcesModel(name: $name, links: $links)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'RssSourcesModel'))
      ..add(DiagnosticsProperty('name', name))
      ..add(DiagnosticsProperty('links', links));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _RssSourcesModel &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.links, links));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(links));

  @JsonKey(ignore: true)
  @override
  _$RssSourcesModelCopyWith<_RssSourcesModel> get copyWith =>
      __$RssSourcesModelCopyWithImpl<_RssSourcesModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RssSourcesModelToJson(this);
  }
}

abstract class _RssSourcesModel implements RssSourcesModel {
  const factory _RssSourcesModel(
      {required String name,
      required List<RssSourceModel> links}) = _$_RssSourcesModel;

  factory _RssSourcesModel.fromJson(Map<String, dynamic> json) =
      _$_RssSourcesModel.fromJson;

  @override
  String get name;
  @override
  List<RssSourceModel> get links;
  @override
  @JsonKey(ignore: true)
  _$RssSourcesModelCopyWith<_RssSourcesModel> get copyWith =>
      throw _privateConstructorUsedError;
}
