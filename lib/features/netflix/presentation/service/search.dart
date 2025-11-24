  import 'package:netflixclone/features/netflix/data/repository/movie_repo_imp.dart';
  import 'package:netflixclone/features/netflix/domain/entity/movie/movie.dart';
  import 'package:netflixclone/features/netflix/domain/usecase/search_movies.dart';

  class Search {
    static final SearchMovies search = SearchMovies(
      movieRepo: MovieRepoImp.instance,
    );

    static Future<List<Movie>> movies(String query) async => await search(query);
  }
