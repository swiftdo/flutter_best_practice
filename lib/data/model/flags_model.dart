import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'flags_model.freezed.dart';
part 'flags_model.g.dart';

@freezed
class FlagsModel with _$FlagsModel {
  const factory FlagsModel({
    bool? nsfw,
    bool? religious,
    bool? political,
    bool? racist,
    bool? sexist,
    bool? explicit,
  }) = _FlagsModel;

  factory FlagsModel.fromJson(Map<String, dynamic> json) =>
      _$FlagsModelFromJson(json);
}
