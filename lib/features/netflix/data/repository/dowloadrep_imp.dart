import 'package:netflixclone/features/netflix/data/model/api/movie/movie_details_model/movie_details_model.dart';
import 'package:netflixclone/features/netflix/data/source/local/dowload_db.dart';
import 'package:netflixclone/features/netflix/domain/entity/api/movie/movie_details.dart';
import 'package:netflixclone/features/netflix/domain/entity/hive/movie_d.dart';
import 'package:netflixclone/features/netflix/domain/repository/dowload_repo.dart';

class DowloadrepImp extends DowloadRepo {
  DowloadrepImp.internal();

  static DowloadrepImp instance = DowloadrepImp.internal();

  factory DowloadrepImp() => instance;
  final DowloadDb downloads = DowloadDb.instance;
  @override
  Future<void> dowloadMovie(MovieDetails movie) async =>
      await downloads.dowloadMovie(movie as MovieDetailsModel);

  @override
  Future<List<MovieD>> getMovies() async => await downloads.getMovies();
  
  @override
  bool isMovieDownloaded(int id) =>downloads.isMovieDowloaded(id);
  
}
