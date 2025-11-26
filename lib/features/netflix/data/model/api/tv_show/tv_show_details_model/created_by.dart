import 'package:json_annotation/json_annotation.dart';

part 'created_by.g.dart';

@JsonSerializable()
class CreatedBy {
  int? id;
  @JsonKey(name: 'credit_id')
  String? creditId;
  String? name;
  @JsonKey(name: 'original_name')
  String? originalName;
  int? gender;
  @JsonKey(name: 'profile_path')
  String? profilePath;

  CreatedBy({
    this.id,
    this.creditId,
    this.name,
    this.originalName,
    this.gender,
    this.profilePath,
  });

  factory CreatedBy.fromJson(Map<String, dynamic> json) {
    return _$CreatedByFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreatedByToJson(this);
}
