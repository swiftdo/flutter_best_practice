// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'flags_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FlagsModel _$$_FlagsModelFromJson(Map<String, dynamic> json) =>
    _$_FlagsModel(
      nsfw: json['nsfw'] as bool?,
      religious: json['religious'] as bool?,
      political: json['political'] as bool?,
      racist: json['racist'] as bool?,
      sexist: json['sexist'] as bool?,
      explicit: json['explicit'] as bool?,
    );

Map<String, dynamic> _$$_FlagsModelToJson(_$_FlagsModel instance) =>
    <String, dynamic>{
      'nsfw': instance.nsfw,
      'religious': instance.religious,
      'political': instance.political,
      'racist': instance.racist,
      'sexist': instance.sexist,
      'explicit': instance.explicit,
    };
