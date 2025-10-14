import 'package:netflixclone/features/netflix/core/utils/tv_show_category.dart';
import 'package:netflixclone/features/netflix/data/repository/tvshow_rep_imp.dart';
import 'package:netflixclone/features/netflix/domain/entity/tv_show/tv_show.dart';
import 'package:netflixclone/features/netflix/domain/usecase/get_tvshows.dart';

class TvshowFetcher {
  static final GetTvshows getTvShowUseCase = GetTvshows(tvshowRepo: TvshowRepImp.instance);

  static Future<List<TvShow>> getTvShows(TvShowCategory category) async {
    switch (category) {
      case TvShowCategory.airingToday:
        return await getTvShowUseCase(TvShowCategory.airingToday);
      case TvShowCategory.popular:
        return await getTvShowUseCase(TvShowCategory.popular);
      case TvShowCategory.topRated:
        return await getTvShowUseCase(TvShowCategory.topRated);
      case TvShowCategory.trendingDay:
        return await getTvShowUseCase(TvShowCategory.trendingDay);
      case TvShowCategory.trendingWeek:
        return await getTvShowUseCase(TvShowCategory.trendingWeek);
      case TvShowCategory.onTheAir:
        return await getTvShowUseCase(TvShowCategory.onTheAir);
    }
  }
}
