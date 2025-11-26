import 'package:netflixclone/features/netflix/core/utils/movie_category.dart';
import 'package:netflixclone/features/netflix/domain/entity/api/movie/movie.dart';
import 'package:netflixclone/features/netflix/domain/entity/api/movie/movie_details.dart';

abstract class MovieRepo {
  Future<List<Movie>> getMovies(MovieCategory category);
  Future<MovieDetails?> getMovieDetails(int id);
  Future<List<Movie>> getRecommendMovies(int id);
  Future<List<Movie>> searchMovies(String query);
}
