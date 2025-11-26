import 'package:json_annotation/json_annotation.dart';

part 'data.g.dart';

@JsonSerializable()
class Data {
  String? homepage;
  String? overview;
  int? runtime;
  String? tagline;
  String? title;

  Data({this.homepage, this.overview, this.runtime, this.tagline, this.title});

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);
}
