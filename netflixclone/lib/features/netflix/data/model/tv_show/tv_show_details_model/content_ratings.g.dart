// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_ratings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ContentRatings _$ContentRatingsFromJson(Map<String, dynamic> json) =>
    ContentRatings(
      results: (json['results'] as List<dynamic>?)
          ?.map((e) => Result.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ContentRatingsToJson(ContentRatings instance) =>
    <String, dynamic>{'results': instance.results};
