

import 'package:netflixclone/features/netflix/core/utils/tv_show_category.dart';
import 'package:netflixclone/features/netflix/data/source/tvshow_api_service.dart';
import 'package:netflixclone/features/netflix/domain/entity/tv_show/tv_show.dart';
import 'package:netflixclone/features/netflix/domain/repository/tvshow_repo.dart';

class TvshowRepImp extends TvshowRepo {
  TvshowRepImp.internal();

  static TvshowRepImp instance = TvshowRepImp.internal();

  factory TvshowRepImp() => instance;

  final TvshowApiService tvSource = TvshowApiService.instance;

  @override
  Future<List<TvShow>> getAiringTodayTvShows() async{
     return await tvSource.getTvShows(TvShowCategory.airingToday);
  }

  @override
  Future<List<TvShow>> getOntheAirTvShows() async {
   return await tvSource.getTvShows(TvShowCategory.onTheAir);
  
  }

  @override
  Future<List<TvShow>> getPopularTvShows() async {
    return await tvSource.getTvShows(TvShowCategory.popular);
  }

  @override
  Future<List<TvShow>> getTopRatedTvShows() async {
       return await tvSource.getTvShows(TvShowCategory.topRated);
  }

  @override
  Future<List<TvShow>> getTrendingTvShowsDay() async {
  return await tvSource.getTvShows(TvShowCategory.trendingDay);
  }

  @override
  Future<List<TvShow>> getTrendingTvShowsWeek() async {
return await tvSource.getTvShows(TvShowCategory.trendingWeek);
  }

  
}
