// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rss_sources_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RssSourcesModel _$$_RssSourcesModelFromJson(Map<String, dynamic> json) =>
    _$_RssSourcesModel(
      name: json['name'] as String,
      links: (json['links'] as List<dynamic>)
          .map((e) => RssSourceModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RssSourcesModelToJson(_$_RssSourcesModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'links': instance.links,
    };
