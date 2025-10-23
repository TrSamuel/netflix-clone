import 'package:json_annotation/json_annotation.dart';

import 'cast.dart';
import 'crew.dart';

part 'credits.g.dart';

@JsonSerializable()
class Credits {
  List<Cast>? cast;
  List<Crew>? crew;

  Credits({this.cast, this.crew});

  factory Credits.fromJson(Map<String, dynamic> json) {
    return _$CreditsFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CreditsToJson(this);
}
