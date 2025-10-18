import 'package:netflixclone/features/netflix/data/repository/movie_repo_imp.dart';
import 'package:netflixclone/features/netflix/domain/entity/movie/movie.dart';
import 'package:netflixclone/features/netflix/domain/entity/movie/movie_details.dart';
import 'package:netflixclone/features/netflix/domain/usecase/get_moviedetails.dart';
import 'package:netflixclone/features/netflix/domain/usecase/get_movies.dart';
import 'package:netflixclone/features/netflix/core/utils/movie_category.dart';

class MovieFetcher {
  static final GetMovies getmovieUsecase = GetMovies(movieRepo: MovieRepoImp.instance);
    static final GetMoviedetails getmovieDetailsUsecase = GetMoviedetails(movieRepo: MovieRepoImp.instance);

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
      case MovieCategory.comedy:
        return await getmovieUsecase(MovieCategory.comedy);
      case MovieCategory.malayalam:
        return await getmovieUsecase(MovieCategory.malayalam);
      case MovieCategory.english:
        return await getmovieUsecase(MovieCategory.english);
      case MovieCategory.romantic:
        return await getmovieUsecase(MovieCategory.romantic);
      case MovieCategory.thriller:
        return await getmovieUsecase(MovieCategory.thriller);
      case MovieCategory.horror:
        return await getmovieUsecase(MovieCategory.horror);
      case MovieCategory.family:
        return await getmovieUsecase(MovieCategory.family);
      case MovieCategory.action:
        return await getmovieUsecase(MovieCategory.action);
      case MovieCategory.animation:
        return await getmovieUsecase(MovieCategory.animation);
      case MovieCategory.scifiFantasy:
        return await getmovieUsecase(MovieCategory.scifiFantasy);
    }
  }

   static Future<MovieDetails?> getMovieDetails(int id) async =>
      await getmovieDetailsUsecase(id);
}
