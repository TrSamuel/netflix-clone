import 'package:netflixclone/features/netflix/domain/entity/api/movie/movie_details.dart';
import 'package:netflixclone/features/netflix/domain/repository/movie_repo.dart';

class GetMoviedetails {
  final MovieRepo movieRepo;

  GetMoviedetails({required this.movieRepo});

  Future<MovieDetails?> call(int id) => movieRepo.getMovieDetails(id);
}
