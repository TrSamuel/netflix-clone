import 'package:netflixclone/features/netflix/core/utils/tv_show_category.dart';
import 'package:netflixclone/features/netflix/data/source/tvshow_api_service.dart';
import 'package:netflixclone/features/netflix/domain/entity/tv_show/tv_show.dart';
import 'package:netflixclone/features/netflix/domain/entity/tv_show/tvshow_details.dart';
import 'package:netflixclone/features/netflix/domain/repository/tvshow_repo.dart';

class TvshowRepImp extends TvshowRepo {
  TvshowRepImp.internal();

  static TvshowRepImp instance = TvshowRepImp.internal();

  factory TvshowRepImp() => instance;

  final TvshowApiService tvSource = TvshowApiService.instance;

  @override
  Future<List<TvShow>> getTvShows(TvShowCategory category) async =>
      await tvSource.getTvShows(category);

  @override
  Future<TvshowDetails?> getTvShowDetails(int id) async =>
      await tvSource.getTvShowDetails(id);

  @override
  Future<List<TvShow>> getrecommendTvShows(int id) async =>
      await tvSource.getRecommTvShows(id);
}
