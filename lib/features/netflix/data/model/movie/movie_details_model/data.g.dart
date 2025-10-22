// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  homepage: json['homepage'] as String?,
  overview: json['overview'] as String?,
  runtime: (json['runtime'] as num?)?.toInt(),
  tagline: json['tagline'] as String?,
  title: json['title'] as String?,
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'homepage': instance.homepage,
  'overview': instance.overview,
  'runtime': instance.runtime,
  'tagline': instance.tagline,
  'title': instance.title,
};
