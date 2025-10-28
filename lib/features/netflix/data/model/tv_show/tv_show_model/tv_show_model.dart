import 'package:json_annotation/json_annotation.dart';
import 'package:netflixclone/features/netflix/domain/entity/tv_show/tv_show.dart';

part 'tv_show_model.g.dart';

@JsonSerializable()
class TvShowModel extends TvShow {
  bool? adult;
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  int? id;
  String? name;
  @JsonKey(name: 'original_name')
  String? originalName;
  String? overview;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'media_type')
  String? mediaType;
  @JsonKey(name: 'original_language')
  String? originalLanguage;
  @JsonKey(name: 'genre_ids')
  List<int>? genreIds;
  double? popularity;
  @JsonKey(name: 'first_air_date')
  String? firstAirDate;
  @JsonKey(name: 'vote_average')
  double? voteAverage;
  @JsonKey(name: 'vote_count')
  int? voteCount;
  @JsonKey(name: 'origin_country')
  List<String>? originCountry;

  TvShowModel({
    this.adult,
    this.backdropPath,
    this.id,
    this.name,
    this.originalName,
    this.overview,
    this.posterPath,
    this.mediaType,
    this.originalLanguage,
    this.genreIds,
    this.popularity,
    this.firstAirDate,
    this.voteAverage,
    this.voteCount,
    this.originCountry,
  }) : super(id_: id, posterPath_: posterPath);

  factory TvShowModel.fromJson(Map<String, dynamic> json) {
    return _$TvShowModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TvShowModelToJson(this);
}
