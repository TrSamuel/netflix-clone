
import 'package:netflixclone/features/netflix/domain/entity/api/tv_show/tv_show.dart';
import 'package:netflixclone/features/netflix/domain/repository/tvshow_repo.dart';

class GetRecommendtvshows {
  final TvshowRepo tvshowRep;

  GetRecommendtvshows({required this.tvshowRep});

  Future<List<TvShow>> call(int id) => tvshowRep.getrecommendTvShows(id);
}
