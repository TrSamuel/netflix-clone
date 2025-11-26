import 'package:netflixclone/features/netflix/data/repository/dowloadrep_imp.dart';
import 'package:netflixclone/features/netflix/domain/entity/api/movie/movie_details.dart';
import 'package:netflixclone/features/netflix/domain/entity/hive/movie_d.dart';
import 'package:netflixclone/features/netflix/domain/usecase/download/del_movie.dart';
import 'package:netflixclone/features/netflix/domain/usecase/download/dowload_movie.dart';
import 'package:netflixclone/features/netflix/domain/usecase/download/getmovies_d.dart';
import 'package:netflixclone/features/netflix/domain/usecase/download/is_moviedownloaded.dart';

class Download {
  static final DowloadMovie dowloadMovieuse=DowloadMovie(DowloadrepImp.instance);

  static final GetmoviesD getMoviesuse=GetmoviesD(dowloadRepo: DowloadrepImp.instance);

    static final DelMovie delMovie=DelMovie(repo: DowloadrepImp.instance);

  static final IsMoviedownloaded isMoviedownloaded=IsMoviedownloaded(dowloadRepo: DowloadrepImp.instance);

  static dowloadMovie(MovieDetails movie) async =>await dowloadMovieuse(movie);


  static Future<List<MovieD>> getMovies() async =>await getMoviesuse();

  static bool isMovieDowload(int id)=>isMoviedownloaded(id);

  static Future<void>  remove(int id) async =>await delMovie(id);
}