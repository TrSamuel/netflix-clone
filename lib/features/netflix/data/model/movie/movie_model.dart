import 'package:netflixclone/features/netflix/domain/entity/movie/movie.dart';

class MovieModel extends Movie {
  MovieModel({
    required super.id,
    required super.posterPath,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json){ 
        return MovieModel(
            id: json["id"]??0,
            posterPath: json["poster_path"]??'',
        );
    }
}
