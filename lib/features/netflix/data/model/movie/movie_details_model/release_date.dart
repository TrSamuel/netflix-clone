import 'package:json_annotation/json_annotation.dart';

part 'release_date.g.dart';

@JsonSerializable()
class ReleaseDate {
  String? certification;
  List<dynamic>? descriptors;
  @JsonKey(name: 'iso_639_1')
  String? iso6391;
  String? note;
  @JsonKey(name: 'release_date')
  DateTime? releaseDate;
  int? type;

  ReleaseDate({
    this.certification,
    this.descriptors,
    this.iso6391,
    this.note,
    this.releaseDate,
    this.type,
  });

  factory ReleaseDate.fromJson(Map<String, dynamic> json) {
    return _$ReleaseDateFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ReleaseDateToJson(this);
}
