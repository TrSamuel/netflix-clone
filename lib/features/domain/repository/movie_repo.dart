import 'package:netflixclone/features/domain/entity/movie/movie.dart';

abstract class MovieRepo {
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> getTrendMovies();
}
