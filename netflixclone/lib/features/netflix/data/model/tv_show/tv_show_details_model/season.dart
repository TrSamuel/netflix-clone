import 'package:json_annotation/json_annotation.dart';

part 'season.g.dart';

@JsonSerializable()
class Season {
  @JsonKey(name: 'air_date')
  String? airDate;
  @JsonKey(name: 'episode_count')
  int? episodeCount;
  int? id;
  String? name;
  String? overview;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'season_number')
  int? seasonNumber;
  @JsonKey(name: 'vote_average')
  double? voteAverage;

  Season({
    this.airDate,
    this.episodeCount,
    this.id,
    this.name,
    this.overview,
    this.posterPath,
    this.seasonNumber,
    this.voteAverage,
  });

  factory Season.fromJson(Map<String, dynamic> json) {
    return _$SeasonFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SeasonToJson(this);
}
