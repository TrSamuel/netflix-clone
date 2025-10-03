import 'package:flutter/cupertino.dart';
import 'package:netflixclone/features/domain/usecase/get_movies.dart';
import 'package:netflixclone/features/utils/movie_category.dart';

class MovieProvider extends ChangeNotifier {
  final GetMovies getmovieUsecase;

  MovieProvider({required this.getmovieUsecase});

  loadMovies(MovieCategory category) async {
    getmovieUsecase;
    notifyListeners();
  }
}
