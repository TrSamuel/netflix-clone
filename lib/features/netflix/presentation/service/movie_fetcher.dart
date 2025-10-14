import 'package:netflixclone/features/netflix/data/repository/movie_repo_imp.dart';
import 'package:netflixclone/features/netflix/domain/entity/movie/movie.dart';
import 'package:netflixclone/features/netflix/domain/usecase/get_movies.dart';
import 'package:netflixclone/features/netflix/core/utils/movie_category.dart';

class MovieFetcher {
  static final GetMovies getmovieUsecase = GetMovies(movieRepo: MovieRepoImp.instance);

  static Future<List<Movie>> getMovies(MovieCategory category) async {
    switch (category) {
      case MovieCategory.nowPlaying:
        return await getmovieUsecase(MovieCategory.nowPlaying);
      case MovieCategory.popular:
        return await getmovieUsecase(MovieCategory.popular);
      case MovieCategory.topRated:
        return await getmovieUsecase(MovieCategory.topRated);
      case MovieCategory.trendingDay:
        return await getmovieUsecase(MovieCategory.trendingDay);
      case MovieCategory.trendingWeek:
        return await getmovieUsecase(MovieCategory.trendingWeek);
      case MovieCategory.upcoming:
        return await getmovieUsecase(MovieCategory.upcoming);
    }
  }
}
