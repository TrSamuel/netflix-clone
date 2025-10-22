import 'package:json_annotation/json_annotation.dart';

import 'release_date.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
  @JsonKey(name: 'iso_3166_1')
  String? iso31661;
  @JsonKey(name: 'release_dates')
  List<ReleaseDate>? releaseDates;

  Result({this.iso31661, this.releaseDates});

  factory Result.fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
