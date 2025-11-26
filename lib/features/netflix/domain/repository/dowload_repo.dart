import 'package:netflixclone/features/netflix/domain/entity/api/movie/movie_details.dart';
import 'package:netflixclone/features/netflix/domain/entity/hive/movie_d.dart';

abstract class DowloadRepo {
  Future<void>  dowloadMovie(MovieDetails movie);
  Future<List<MovieD>>  getMovies();
  bool isMovieDownloaded(int id);
  delMovie(int id);
}