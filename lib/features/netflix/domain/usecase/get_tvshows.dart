import 'package:netflixclone/features/netflix/core/utils/tv_show_category.dart';
import 'package:netflixclone/features/netflix/domain/entity/tv_show/tv_show.dart';
import 'package:netflixclone/features/netflix/domain/repository/tvshow_repo.dart';

class GetTvshows {
  final TvshowRepo tvshowRepo;

  GetTvshows({required this.tvshowRepo});

  Future<List<TvShow>> call(TvShowCategory category) async {
    switch (category) {
      case TvShowCategory.airingToday:
        return tvshowRepo.getAiringTodayTvShows();
      case TvShowCategory.topRated:
        return tvshowRepo.getTopRatedTvShows();
      case TvShowCategory.popular:
        return tvshowRepo.getPopularTvShows();
      case TvShowCategory.onTheAir:
        return tvshowRepo.getOntheAirTvShows();
      case TvShowCategory.trendingDay:
        return tvshowRepo.getTrendingTvShowsDay();
      case TvShowCategory.trendingWeek:
        return tvshowRepo.getTrendingTvShowsWeek();
    }
  }
}
