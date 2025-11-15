// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'release_date.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReleaseDate _$ReleaseDateFromJson(Map<String, dynamic> json) => ReleaseDate(
  certification: json['certification'] as String?,
  descriptors: json['descriptors'] as List<dynamic>?,
  iso6391: json['iso_639_1'] as String?,
  note: json['note'] as String?,
  releaseDate: json['release_date'] == null
      ? null
      : DateTime.parse(json['release_date'] as String),
  type: (json['type'] as num?)?.toInt(),
);

Map<String, dynamic> _$ReleaseDateToJson(ReleaseDate instance) =>
    <String, dynamic>{
      'certification': instance.certification,
      'descriptors': instance.descriptors,
      'iso_639_1': instance.iso6391,
      'note': instance.note,
      'release_date': instance.releaseDate?.toIso8601String(),
      'type': instance.type,
    };
