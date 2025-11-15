// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
  iso31661: json['iso_3166_1'] as String?,
  releaseDates: (json['release_dates'] as List<dynamic>?)
      ?.map((e) => ReleaseDate.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
  'iso_3166_1': instance.iso31661,
  'release_dates': instance.releaseDates,
};
