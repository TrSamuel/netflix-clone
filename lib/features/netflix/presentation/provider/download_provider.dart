import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/domain/entity/api/movie/movie_details.dart';
import 'package:netflixclone/features/netflix/domain/entity/hive/movie_d.dart';
import 'package:netflixclone/features/netflix/presentation/service/download.dart';

class DownloadProvider extends ChangeNotifier {
  List<MovieD> movies = [];
  bool movieStatus=false;

  addMovie(MovieDetails movie) async {
     await Download.dowloadMovie(movie);
      await isMoviedownloaded(movie.id_!);
     getMovies();
  }

  getMovies() async {
    movies=await  Download.getMovies();
    notifyListeners();
  }

   isMoviedownloaded(int id)  {
    movieStatus=Download.isMovieDowload(id);
    notifyListeners();
   }

   delMovie(int id) async {
    await Download.remove(id);
    getMovies();
   }
}
