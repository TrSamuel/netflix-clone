import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'content_ratings.g.dart';

@JsonSerializable()
class ContentRatings {
  List<Result>? results;

  ContentRatings({this.results});

  factory ContentRatings.fromJson(Map<String, dynamic> json) {
    return _$ContentRatingsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ContentRatingsToJson(this);
}
