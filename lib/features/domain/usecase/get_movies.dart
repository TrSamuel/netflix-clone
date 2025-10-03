import 'package:netflixclone/features/domain/entity/movie/movie.dart';
import 'package:netflixclone/features/domain/repository/movie_repo.dart';
import 'package:netflixclone/features/utils/movie_category.dart';

class GetMovies {
  final MovieRepo movieRepo;

  GetMovies({required this.movieRepo});

  Future<List<Movie>> call(MovieCategory category) async{
    switch (category) {
      case MovieCategory.popular:
        return movieRepo.getPopularMovies();
      case MovieCategory.trending:
        return movieRepo.getTrendMovies();
    }
  }
}
