
import 'package:netflixclone/features/netflix/domain/entity/movie/movie.dart';

part 'movie_model.g.dart';

class MovieModel extends Movie {

  MovieModel({
   required super.id,
   required super.posterPath,
   required super.title,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return _$MovieModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MovieModelToJson(this);
}
