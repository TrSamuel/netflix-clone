import 'package:netflixclone/features/netflix/domain/entity/tv_show/tv_show.dart';

abstract class TvshowRepo {
  Future<List<TvShow>> getTrendingTvShowsDay();
  Future<List<TvShow>> getTrendingTvShowsWeek();
  Future<List<TvShow>> getAiringTodayTvShows();
  Future<List<TvShow>> getOntheAirTvShows();
  Future<List<TvShow>> getPopularTvShows();
  Future<List<TvShow>> getTopRatedTvShows();
}
