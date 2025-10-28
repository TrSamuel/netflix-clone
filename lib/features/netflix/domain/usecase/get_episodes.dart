import 'package:netflixclone/features/netflix/domain/entity/tv_show/episode.dart';
import 'package:netflixclone/features/netflix/domain/repository/tvshow_repo.dart';

class GetEpisodes {
  final TvshowRepo tvshowRepo;

  GetEpisodes({required this.tvshowRepo});

  Future<List<Episode>> call(int seriesId, int seasonId) =>
      tvshowRepo.getEpisodes(seriesId, seasonId);
}
