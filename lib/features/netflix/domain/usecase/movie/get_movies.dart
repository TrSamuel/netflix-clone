import 'package:netflixclone/features/netflix/domain/entity/api/movie/movie.dart';
import 'package:netflixclone/features/netflix/domain/repository/movie_repo.dart';
import 'package:netflixclone/features/netflix/core/utils/movie_category.dart';

class GetMovies {
  final MovieRepo movieRepo;

  GetMovies({required this.movieRepo});

  Future<List<Movie>> call(MovieCategory category) {
    return movieRepo.getMovies(category);
  }
}
