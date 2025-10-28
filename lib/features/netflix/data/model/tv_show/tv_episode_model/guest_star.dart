import 'package:json_annotation/json_annotation.dart';

part 'guest_star.g.dart';

@JsonSerializable()
class GuestStar {
  String? character;
  @JsonKey(name: 'credit_id')
  String? creditId;
  int? order;
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
  String? profilePath;

  GuestStar({
    this.character,
    this.creditId,
    this.order,
    this.adult,
    this.gender,
    this.id,
    this.knownForDepartment,
    this.name,
    this.originalName,
    this.popularity,
    this.profilePath,
  });

  factory GuestStar.fromJson(Map<String, dynamic> json) {
    return _$GuestStarFromJson(json);
  }

  Map<String, dynamic> toJson() => _$GuestStarToJson(this);
}
