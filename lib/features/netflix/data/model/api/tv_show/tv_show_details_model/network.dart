import 'package:json_annotation/json_annotation.dart';

part 'network.g.dart';

@JsonSerializable()
class Network {
  int? id;
  @JsonKey(name: 'logo_path')
  String? logoPath;
  String? name;
  @JsonKey(name: 'origin_country')
  String? originCountry;

  Network({this.id, this.logoPath, this.name, this.originCountry});

  factory Network.fromJson(Map<String, dynamic> json) {
    return _$NetworkFromJson(json);
  }

  Map<String, dynamic> toJson() => _$NetworkToJson(this);
}
