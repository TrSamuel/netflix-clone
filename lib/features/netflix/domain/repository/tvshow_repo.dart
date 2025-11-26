import 'package:netflixclone/features/netflix/core/utils/tv_show_category.dart';
import 'package:netflixclone/features/netflix/domain/entity/api/tv_show/episode.dart';
import 'package:netflixclone/features/netflix/domain/entity/api/tv_show/tv_show.dart';
import 'package:netflixclone/features/netflix/domain/entity/api/tv_show/tvshow_details.dart';

abstract class TvshowRepo {
  Future<List<TvShow>> getTvShows(TvShowCategory category);

  Future<TvshowDetails?> getTvShowDetails(int id);

  Future<List<Episode>> getEpisodes(int seriesId, int seasonId);

  Future<List<TvShow>> getrecommendTvShows(int id);

  Future<List<TvShow>> searchTvshows(String query);
}
