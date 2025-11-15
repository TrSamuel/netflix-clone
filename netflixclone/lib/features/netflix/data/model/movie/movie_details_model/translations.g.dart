// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'translations.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Translations _$TranslationsFromJson(Map<String, dynamic> json) => Translations(
  translations: (json['translations'] as List<dynamic>?)
      ?.map((e) => Translation.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$TranslationsToJson(Translations instance) =>
    <String, dynamic>{'translations': instance.translations};
