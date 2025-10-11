import 'package:netflixclone/features/netflix/domain/entity/movie/movie.dart';

abstract class MovieRepo {
  Future<List<Movie>> getNowPlayingMovies();
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> getTopRated();
    Future<List<Movie>> getUpcoming();
  Future<List<Movie>> getTrendingMoviesDay();
   Future<List<Movie>> getTrendingMoviesWeek();
}
