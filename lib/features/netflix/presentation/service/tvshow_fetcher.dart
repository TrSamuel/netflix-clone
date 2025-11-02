import 'package:netflixclone/features/netflix/core/utils/tv_show_category.dart';
import 'package:netflixclone/features/netflix/data/repository/tvshow_rep_imp.dart';
import 'package:netflixclone/features/netflix/domain/entity/tv_show/episode.dart';
import 'package:netflixclone/features/netflix/domain/entity/tv_show/tv_show.dart';
import 'package:netflixclone/features/netflix/domain/entity/tv_show/tvshow_details.dart';
import 'package:netflixclone/features/netflix/domain/usecase/get_episodes.dart';
import 'package:netflixclone/features/netflix/domain/usecase/get_recommendTvShows.dart';
import 'package:netflixclone/features/netflix/domain/usecase/get_tvshowdetails.dart';
import 'package:netflixclone/features/netflix/domain/usecase/get_tvshows.dart';

class TvshowFetcher {
  static final GetTvshows getTvShowUseCase = GetTvshows(
    tvshowRepo: TvshowRepImp.instance,
  );

  static final GetTvshowdetails _getTvshowdetails = GetTvshowdetails(
    tvshowRepo: TvshowRepImp.instance,
  );

  static final GetRecommendtvshows _getRecommendtvshows = GetRecommendtvshows(
    tvshowRep: TvshowRepImp.instance,
  );

  static final GetEpisodes _getEpisodes = GetEpisodes(
    tvshowRepo: TvshowRepImp.instance,
  );

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

  static Future<TvshowDetails?> getTvShowDetails(int id) async =>
      await _getTvshowdetails(id);

  static Future<List<Episode>> getEpisodes(int seriesId, int seasonId) async =>
      await _getEpisodes(seriesId, seasonId);

  static Future<List<TvShow>> getRecommTvShows(int id) async =>
      await _getRecommendtvshows(id);
}
