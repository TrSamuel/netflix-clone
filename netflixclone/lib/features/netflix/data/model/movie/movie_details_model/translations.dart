import 'package:json_annotation/json_annotation.dart';

import 'translation.dart';

part 'translations.g.dart';

@JsonSerializable()
class Translations {
  List<Translation>? translations;

  Translations({this.translations});

  factory Translations.fromJson(Map<String, dynamic> json) {
    return _$TranslationsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TranslationsToJson(this);
}
