import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/domain/entity/api/movie/movie_details.dart';
import 'package:netflixclone/features/netflix/domain/entity/hive/movie_d.dart';
import 'package:netflixclone/features/netflix/presentation/service/download.dart';

class DownloadProvider extends ChangeNotifier {
  List<MovieD> movies = [];
  bool movieStatus=false;

  addMovie(MovieDetails movie) async {
     await Download.dowloadMovie(movie);
     getMovies();
  }

  getMovies() async {
    movies=await  Download.getMovies();
    notifyListeners();
  }

   isMoviedownloaded(int id) async {
    movieStatus=Download.isMovieDowload(id);
    notifyListeners();
   }
}
