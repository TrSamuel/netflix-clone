import 'package:netflixclone/features/netflix/domain/entity/movie/movie.dart';

class MovieModel extends Movie {
  MovieModel({
    required super.adult,
    required super.backdropPath,
    required super.genreIds,
    required super.id,
    required super.originalLanguage,
    required super.originalTitle,
    required super.overview,
    required super.popularity,
    required super.posterPath,
    required super.releaseDate,
    required super.title,
    required super.video,
    required super.voteAverage,
    required super.voteCount,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json){ 
        return MovieModel(
            adult: json["adult"]??false,
            backdropPath: json["backdrop_path"]??'',
            genreIds: json["genre_ids"] == null ? [] : List<int>.from((json["genre_ids"])),
            id: json["id"]??0,
            originalLanguage: json["original_language"]??'',
            originalTitle: json["original_title"]??'',
            overview: json["overview"]??'',
            popularity: json["popularity"]??0,
            posterPath: json["poster_path"]??'',
            releaseDate: json["release_date"]==null ? DateTime.now(): DateTime.parse(json["release_date"]),
            title: json["title"]??'',
            video: json["video"]??false,
            voteAverage: json["vote_average"]??0,
            voteCount: json["vote_count"]??0,
        );
    }
}
