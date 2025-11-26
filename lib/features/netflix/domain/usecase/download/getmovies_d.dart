import 'package:netflixclone/features/netflix/domain/entity/hive/movie_d.dart';
import 'package:netflixclone/features/netflix/domain/repository/dowload_repo.dart';

class GetmoviesD {
  final  DowloadRepo dowloadRepo;

  GetmoviesD({required this.dowloadRepo});


  Future<List<MovieD>>  call()=>dowloadRepo.getMovies();
}