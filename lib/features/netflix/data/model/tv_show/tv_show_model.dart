import 'package:netflixclone/features/netflix/domain/entity/tv_show/tv_show.dart';

class TvShowModel extends TvShow {
  TvShowModel({
    required super.adult,
    required super.backdropPath,
    required super.id,
    required super.name,
    required super.originalName,
    required super.overview,
    required super.posterPath,
    required super.mediaType,
    required super.originalLanguage,
    required super.genreIds,
    required super.popularity,
    required super.firstAirDate,
    required super.voteAverage,
    required super.voteCount,
    required super.originCountry,
  });

  factory TvShowModel.fromJson(Map<String, dynamic> json) {
    return TvShowModel(
      adult: json["adult"] ?? false,
      backdropPath: json["backdrop_path"] ?? '',
      id: json["id"] ?? 0,
      name: json["name"] ?? '',
      originalName: json["original_name"] ?? '',
      overview: json["overview"] ?? '',
      posterPath: json["poster_path"] ?? '',
      mediaType: json["media_type"] ?? '',
      originalLanguage: json["original_language"] ?? '',
      genreIds: json["genre_ids"] == null
          ? []
          : List<int>.from((json["genre_ids"])),
      popularity: json["popularity"] ?? 0,
      firstAirDate: json["first_air_date"] == null
          ? DateTime.now()
          : DateTime.parse(json["first_air_date"]),
      voteAverage: json["vote_average"] ?? 0,
      voteCount: json["vote_count"] ?? 0,
      originCountry: json["origin_country"] == null
          ? []
          : List<String>.from(json["origin_country"]),
    );
  }
}
