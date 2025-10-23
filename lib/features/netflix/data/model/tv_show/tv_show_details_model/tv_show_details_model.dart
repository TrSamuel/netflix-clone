import 'package:json_annotation/json_annotation.dart';
import 'package:netflixclone/features/netflix/domain/entity/tv_show/episode.dart';
import 'package:netflixclone/features/netflix/domain/entity/tv_show/tvshow_details.dart';

import 'content_ratings.dart';
import 'created_by.dart';
import 'credits.dart';
import 'genre.dart';
import 'last_episode_to_air.dart';
import 'network.dart';
import 'production_company.dart';
import 'production_country.dart';
import 'season.dart';
import 'spoken_language.dart';

part 'tv_show_details_model.g.dart';

@JsonSerializable()
class TvShowDetailsModel extends TvshowDetails {
  bool? adult;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'created_by')
  List<CreatedBy>? createdBy;
  @JsonKey(name: 'episode_run_time')
  List<dynamic>? episodeRunTime;
  @JsonKey(name: 'first_air_date')
  String? firstAirDate;
  List<Genre>? genres;
  String? homepage;
  int? id;
  @JsonKey(name: 'in_production')
  bool? inProduction;
  List<String>? languages;
  @JsonKey(name: 'last_air_date')
  String? lastAirDate;
  @JsonKey(name: 'last_episode_to_air')
  LastEpisodeToAir? lastEpisodeToAir;
  String? name;
  @JsonKey(name: 'next_episode_to_air')
  dynamic nextEpisodeToAir;
  List<Network>? networks;
  @JsonKey(name: 'number_of_episodes')
  int? numberOfEpisodes;
  @JsonKey(name: 'number_of_seasons')
  int? numberOfSeasons;
  @JsonKey(name: 'origin_country')
  List<String>? originCountry;
  @JsonKey(name: 'original_language')
  String? originalLanguage;
  @JsonKey(name: 'original_name')
  String? originalName;
  String? overview;
  double? popularity;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'production_companies')
  List<ProductionCompany>? productionCompanies;
  @JsonKey(name: 'production_countries')
  List<ProductionCountry>? productionCountries;
  List<Season>? seasons;
  @JsonKey(name: 'spoken_languages')
  List<SpokenLanguage>? spokenLanguages;
  String? status;
  String? tagline;
  String? type;
  @JsonKey(name: 'vote_average')
  double? voteAverage;
  @JsonKey(name: 'vote_count')
  int? voteCount;
  Credits? credits;
  @JsonKey(name: 'content_ratings')
  ContentRatings? contentRatings;

  TvShowDetailsModel({
    this.adult,
    this.backdropPath,
    this.createdBy,
    this.episodeRunTime,
    this.firstAirDate,
    this.genres,
    this.homepage,
    this.id,
    this.inProduction,
    this.languages,
    this.lastAirDate,
    this.lastEpisodeToAir,
    this.name,
    this.nextEpisodeToAir,
    this.networks,
    this.numberOfEpisodes,
    this.numberOfSeasons,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.seasons,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.type,
    this.voteAverage,
    this.voteCount,
    this.credits,
    this.contentRatings,
  }) : super(
         id: id,
         backdropPath: backdropPath,
         releaseDate: DateTime.parse(firstAirDate!),
         maturityRating: contentRatings!.results!.first.rating,
         noOfSeasons: numberOfSeasons,
         name: name,
         genres_: genres!.map((g) => g.name).toList(),
         originalName: originalName,
         overview: overview,
         casts: credits!.cast!.map((c) => c.name).toList(),
         episodes: seasons!
             .map(
               (s) => Episode(
                 id: s.id,
                 name: s.name,
                 overview: s.overview,
                 posterPath: s.posterPath,
                 seasonNumber: s.seasonNumber,
                 episodeCount: s.episodeCount,
               ),
             )
             .toList(),
       );

  factory TvShowDetailsModel.fromJson(Map<String, dynamic> json) {
    return _$TvShowDetailsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TvShowDetailsModelToJson(this);
}
