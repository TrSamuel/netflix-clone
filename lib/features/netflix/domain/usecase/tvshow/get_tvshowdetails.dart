import 'package:netflixclone/features/netflix/domain/entity/tv_show/tvshow_details.dart';
import 'package:netflixclone/features/netflix/domain/repository/tvshow_repo.dart';

class GetTvshowdetails {
  final TvshowRepo tvshowRepo;

  GetTvshowdetails({required this.tvshowRepo});

  Future<TvshowDetails?> call(int id) => tvshowRepo.getTvShowDetails(id);
}
