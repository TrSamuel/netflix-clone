import 'package:netflixclone/features/netflix/domain/entity/movie/movie.dart';
import 'package:netflixclone/features/netflix/domain/repository/movie_repo.dart';

class GetRecommendmovies {
  final MovieRepo movieRepo;

  GetRecommendmovies({required this.movieRepo});

  Future<List<Movie>> call(int id) => movieRepo.getRecommendMovies(id);
}
