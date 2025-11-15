import 'package:json_annotation/json_annotation.dart';

import 'result.dart';

part 'release_dates.g.dart';

@JsonSerializable()
class ReleaseDates {
  List<Result>? results;

  ReleaseDates({this.results});

  factory ReleaseDates.fromJson(Map<String, dynamic> json) {
    return _$ReleaseDatesFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReleaseDatesToJson(this);
}
