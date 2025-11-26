import 'package:netflixclone/features/netflix/domain/entity/api/movie/movie_details.dart';
import 'package:netflixclone/features/netflix/domain/repository/dowload_repo.dart';

class DowloadMovie {
  final DowloadRepo _dowloadRepo;

  DowloadMovie(this._dowloadRepo);

  Future<void>  call(MovieDetails movie)=> _dowloadRepo.dowloadMovie(movie);
}