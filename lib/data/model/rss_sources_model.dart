import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'rss_source_model.dart';
part 'rss_sources_model.freezed.dart';
part 'rss_sources_model.g.dart';

@freezed
class RssSourcesModel with _$RssSourcesModel {
  const factory RssSourcesModel({
    required String name,
    required List<RssSourceModel> links,
  }) = _RssSourcesModel;

  factory RssSourcesModel.fromJson(Map<String, dynamic> json) =>
      _$RssSourcesModelFromJson(json);
}
