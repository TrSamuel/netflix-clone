// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Translation _$TranslationFromJson(Map<String, dynamic> json) => Translation(
  iso31661: json['iso_3166_1'] as String?,
  iso6391: json['iso_639_1'] as String?,
  name: json['name'] as String?,
  englishName: json['english_name'] as String?,
  data: json['data'] == null
      ? null
      : Data.fromJson(json['data'] as Map<String, dynamic>),
);

Map<String, dynamic> _$TranslationToJson(Translation instance) =>
    <String, dynamic>{
      'iso_3166_1': instance.iso31661,
      'iso_639_1': instance.iso6391,
      'name': instance.name,
      'english_name': instance.englishName,
      'data': instance.data,
    };
