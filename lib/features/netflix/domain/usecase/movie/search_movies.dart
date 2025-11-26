import 'package:netflixclone/features/netflix/domain/entity/api/movie/movie.dart';
import 'package:netflixclone/features/netflix/domain/repository/movie_repo.dart';

class SearchMovies {
  final MovieRepo movieRepo;

  SearchMovies({required this.movieRepo});

  Future<List<Movie>>  call(String query)=>movieRepo.searchMovies(query);

}