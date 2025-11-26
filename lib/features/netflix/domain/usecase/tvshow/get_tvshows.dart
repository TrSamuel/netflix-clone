import 'package:netflixclone/features/netflix/core/utils/tv_show_category.dart';
import 'package:netflixclone/features/netflix/domain/entity/api/tv_show/tv_show.dart';
import 'package:netflixclone/features/netflix/domain/repository/tvshow_repo.dart';

class GetTvshows {
  final TvshowRepo tvshowRepo;

  GetTvshows({required this.tvshowRepo});

  Future<List<TvShow>> call(TvShowCategory category) {
    return tvshowRepo.getTvShows(category);
  }
}
