import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/utils/debouncer.dart';
import 'package:netflixclone/features/netflix/domain/entity/game/game.dart';
import 'package:netflixclone/features/netflix/domain/entity/movie/movie.dart';
import 'package:netflixclone/features/netflix/domain/entity/tv_show/tv_show.dart';
import 'package:netflixclone/features/netflix/presentation/service/search.dart';

class SearchProvider extends ChangeNotifier {
  List<Movie> movies = [];
  List<TvShow> tvShows = [];
  List<Game>  games=[];
  List<Object> combined = [];
  bool isSearching = false;

  Debouncer debouncer = Debouncer(milliseconds: 100);

  getQuery(String query) {
    if (query.trim().isNotEmpty) {
      debouncer.run(() async {
        isSearching = true;
        movies = await Search.movies(query);
        tvShows = await Search.tvshows(query);
        games=await Search.games(query);
        combined = [...movies, ...tvShows];
        notifyListeners();
      });
    } else {
      isSearching = false;
      movies = [];
      tvShows = [];
      combined = [];
      games=[];
      notifyListeners();
    }
  }

  clear() {
    isSearching = false;
    movies = [];
    tvShows = [];
    combined = [];
    games=[];
    notifyListeners();
  }
}
