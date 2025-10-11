import 'package:netflixclone/features/netflix/domain/entity/movie/movie.dart';
import 'package:netflixclone/features/netflix/domain/repository/movie_repo.dart';
import 'package:netflixclone/features/netflix/core/utils/movie_category.dart';

class GetMovies {
  final MovieRepo movieRepo;

  GetMovies({required this.movieRepo});

  Future<List<Movie>> call(MovieCategory category) async {
    switch (category) {
      case MovieCategory.popular:
        return movieRepo.getPopularMovies();
      case MovieCategory.trendingDay:
        return movieRepo.getTrendingMoviesDay();
      case MovieCategory.trendingWeek:
        return movieRepo.getTrendingMoviesWeek();
      case MovieCategory.nowPlaying:
        return movieRepo.getNowPlayingMovies();
      case MovieCategory.topRated:
        return movieRepo.getTopRated();
      case MovieCategory.upcoming:
        return movieRepo.getUpcoming();
    }
  }
}
