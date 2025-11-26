import 'package:netflixclone/features/netflix/data/repository/game_repo_imp.dart';
import 'package:netflixclone/features/netflix/data/repository/movie_repo_imp.dart';
import 'package:netflixclone/features/netflix/data/repository/tvshow_rep_imp.dart';
import 'package:netflixclone/features/netflix/domain/entity/api/game/game.dart';
import 'package:netflixclone/features/netflix/domain/entity/api/movie/movie.dart';
import 'package:netflixclone/features/netflix/domain/entity/api/tv_show/tv_show.dart';
import 'package:netflixclone/features/netflix/domain/usecase/game/search_games.dart';
import 'package:netflixclone/features/netflix/domain/usecase/movie/search_movies.dart';
import 'package:netflixclone/features/netflix/domain/usecase/tvshow/search_tvshows.dart';

class Search {
  static final SearchMovies searchMovies = SearchMovies(
    movieRepo: MovieRepoImp.instance,
  );

  static final SearchTvshows searchTvshows = SearchTvshows(
    tvshowRepo: TvshowRepImp.instance,
  );

  static final SearchGames searchGames = SearchGames(
    gameRepo: GameRepoImp.instance,
  );
  static Future<List<Movie>> movies(String query) async {
    return await searchMovies(query);
  }

  static Future<List<TvShow>> tvshows(String query) async {
    return await searchTvshows(query);
  }

  static Future<List<Game>> games(String query) async {
    return await searchGames(query);
  }
}
