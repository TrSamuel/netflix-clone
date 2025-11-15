// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'result.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Result _$ResultFromJson(Map<String, dynamic> json) => Result(
  descriptors: json['descriptors'] as List<dynamic>?,
  iso31661: json['iso_3166_1'] as String?,
  rating: json['rating'] as String?,
);

Map<String, dynamic> _$ResultToJson(Result instance) => <String, dynamic>{
  'descriptors': instance.descriptors,
  'iso_3166_1': instance.iso31661,
  'rating': instance.rating,
};
