import 'package:netflixclone/features/data/source/movie_source.dart';
import 'package:netflixclone/features/domain/entity/movie/movie.dart';
import 'package:netflixclone/features/domain/repository/movie_repo.dart';
import 'package:netflixclone/features/utils/movie_category.dart';

class MovieRepoImp extends MovieRepo {
  final MovieSource movieSource=MovieSource();
  @override
  Future<List<Movie>> getPopularMovies() async {
    return movieSource.getMovies(MovieCategory.popular);
  }

  @override
  Future<List<Movie>> getTrendMovies() async {
    return movieSource.getMovies(MovieCategory.trending);
  }
}
