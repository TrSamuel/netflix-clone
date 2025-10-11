import 'package:netflixclone/features/netflix/data/source/movie_api_service.dart';
import 'package:netflixclone/features/netflix/domain/entity/movie/movie.dart';
import 'package:netflixclone/features/netflix/domain/repository/movie_repo.dart';
import 'package:netflixclone/features/netflix/core/utils/movie_category.dart';

class MovieRepoImp extends MovieRepo {
  MovieRepoImp.internal();

  static MovieRepoImp instance = MovieRepoImp.internal();

  factory MovieRepoImp() => instance;

  final MovieApiService movieSource = MovieApiService.instance;

  @override
  Future<List<Movie>> getPopularMovies() async {
    return await movieSource.getMovies(MovieCategory.popular);
  }

  @override
  Future<List<Movie>> getNowPlayingMovies() async {
    return await movieSource.getMovies(MovieCategory.nowPlaying);
  }

  @override
  Future<List<Movie>> getTopRated() async {
    return await movieSource.getMovies(MovieCategory.topRated);
  }

  @override
  Future<List<Movie>> getTrendingMoviesDay() async {
    return await movieSource.getMovies(MovieCategory.trendingDay);
  }

  @override
  Future<List<Movie>> getTrendingMoviesWeek() async {
    return await movieSource.getMovies(MovieCategory.trendingWeek);
  }

  @override
  Future<List<Movie>> getUpcoming() async {
    return await movieSource.getMovies(MovieCategory.upcoming);
  }
}
