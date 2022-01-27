import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rss_source_model.freezed.dart';
part 'rss_source_model.g.dart';

@freezed
class RssSourceModel with _$RssSourceModel {
  const factory RssSourceModel({
    required String name,
    required String logo,
    required String url,
  }) = _RssSourceModel;

  factory RssSourceModel.fromJson(Map<String, dynamic> json) =>
      _$RssSourceModelFromJson(json);
}
