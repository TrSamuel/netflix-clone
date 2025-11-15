import 'package:json_annotation/json_annotation.dart';

part 'crew.g.dart';

@JsonSerializable()
class Crew {
  bool? adult;
  int? gender;
  int? id;
  @JsonKey(name: 'known_for_department')
  String? knownForDepartment;
  String? name;
  @JsonKey(name: 'original_name')
  String? originalName;
  double? popularity;
  @JsonKey(name: 'profile_path')
  dynamic profilePath;
  @JsonKey(name: 'credit_id')
  String? creditId;
  String? department;
  String? job;

  Crew({
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
    this.creditId,
    this.department,
    this.job,
  });

  factory Crew.fromJson(Map<String, dynamic> json) => _$CrewFromJson(json);

  Map<String, dynamic> toJson() => _$CrewToJson(this);
}
