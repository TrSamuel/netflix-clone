import 'package:netflixclone/features/netflix/data/source/movie_api_service.dart';
import 'package:netflixclone/features/netflix/domain/entity/movie/movie.dart';
import 'package:netflixclone/features/netflix/domain/entity/movie/movie_details.dart';
import 'package:netflixclone/features/netflix/domain/repository/movie_repo.dart';
import 'package:netflixclone/features/netflix/core/utils/movie_category.dart';

class MovieRepoImp extends MovieRepo {
  MovieRepoImp.internal();

  static MovieRepoImp instance = MovieRepoImp.internal();

  factory MovieRepoImp() => instance;

  final MovieApiService movieSource = MovieApiService.instance;

  @override
  Future<List<Movie>> getMovies(MovieCategory category) async {
    return await movieSource.getMovies(category);
  }

  @override
  Future<MovieDetails?> getMovieDetails(int id) async {
    return await movieSource.getMovieDetails(id);
  }
}
