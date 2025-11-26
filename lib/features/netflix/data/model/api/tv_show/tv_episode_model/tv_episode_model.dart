import 'package:json_annotation/json_annotation.dart';
import 'package:netflixclone/features/netflix/domain/entity/api/tv_show/episode.dart';

import 'crew.dart';
import 'guest_star.dart';

part 'tv_episode_model.g.dart';

@JsonSerializable()
class TvEpisodeModel extends Episode {
  @JsonKey(name: 'air_date')
  String? airDate;
  @JsonKey(name: 'episode_number')
  int? episodeNumber;
  @JsonKey(name: 'episode_type')
  String? episodeType;
  int? id;
  String? name;
  String? overview;
  @JsonKey(name: 'production_code')
  String? productionCode;
  int? runtime;
  @JsonKey(name: 'season_number')
  int? seasonNumber;
  @JsonKey(name: 'show_id')
  int? showId;
  @JsonKey(name: 'still_path')
  String? stillPath;
  @JsonKey(name: 'vote_average')
  double? voteAverage;
  @JsonKey(name: 'vote_count')
  int? voteCount;
  List<Crew>? crew;
  @JsonKey(name: 'guest_stars')
  List<GuestStar>? guestStars;

  TvEpisodeModel({
    this.airDate,
    this.episodeNumber,
    this.episodeType,
    this.id,
    this.name,
    this.overview,
    this.productionCode,
    this.runtime,
    this.seasonNumber,
    this.showId,
    this.stillPath,
    this.voteAverage,
    this.voteCount,
    this.crew,
    this.guestStars,
  }) : super(
         id_: id,
         name_: name,
         overview_: overview,
         stillPath_: stillPath,
         runTime_: runtime != null
             ? (runtime % 60 != 0
                   ? runtime ~/ 60 != 0
                         ? '${runtime ~/ 60}h ${runtime % 60}m'
                         : '${runtime % 60}m'
                   : '${runtime ~/ 60}h')
             : '',
       );

  factory TvEpisodeModel.fromJson(Map<String, dynamic> json) {
    return _$TvEpisodeModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TvEpisodeModelToJson(this);
}
