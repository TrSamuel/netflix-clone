import 'package:json_annotation/json_annotation.dart';

part 'result.g.dart';

@JsonSerializable()
class Result {
  List<dynamic>? descriptors;
  @JsonKey(name: 'iso_3166_1')
  String? iso31661;
  String? rating;

  Result({this.descriptors, this.iso31661, this.rating});

  factory Result.fromJson(Map<String, dynamic> json) {
    return _$ResultFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ResultToJson(this);
}
