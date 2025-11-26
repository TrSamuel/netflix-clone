import 'package:json_annotation/json_annotation.dart';

import 'data.dart';

part 'translation.g.dart';

@JsonSerializable()
class Translation {
  @JsonKey(name: 'iso_3166_1')
  String? iso31661;
  @JsonKey(name: 'iso_639_1')
  String? iso6391;
  String? name;
  @JsonKey(name: 'english_name')
  String? englishName;
  Data? data;

  Translation({
    this.iso31661,
    this.iso6391,
    this.name,
    this.englishName,
    this.data,
  });

  factory Translation.fromJson(Map<String, dynamic> json) {
    return _$TranslationFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TranslationToJson(this);
}
