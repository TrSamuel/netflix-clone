import 'package:netflixclone/features/netflix/core/utils/movie_category.dart';
import 'package:netflixclone/features/netflix/domain/entity/movie/movie.dart';

abstract class MovieRepo {
  Future<List<Movie>> getMovies(MovieCategory category);
}
