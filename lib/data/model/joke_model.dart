import 'package:flutter/foundation.dart';
import 'package:flutter_best_practice/data/model/flags_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'joke_model.freezed.dart';
part 'joke_model.g.dart';

@freezed
class JokeModel with _$JokeModel {
  const factory JokeModel({
    required bool safe,
    String? category,
    String? delivery,
    FlagsModel? flags,
    int? id,
    String? lang,
    String? setup,
    String? type,
  }) = _JokeModel;

  factory JokeModel.fromJson(Map<String, dynamic> json) =>
      _$JokeModelFromJson(json);
}
