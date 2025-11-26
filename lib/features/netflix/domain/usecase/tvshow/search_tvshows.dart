import 'package:netflixclone/features/netflix/domain/entity/api/tv_show/tv_show.dart';
import 'package:netflixclone/features/netflix/domain/repository/tvshow_repo.dart';

class SearchTvshows {
  final TvshowRepo tvshowRepo;

  SearchTvshows({required this.tvshowRepo});

  Future<List<TvShow>>  call(String query)=>tvshowRepo.searchTvshows(query);
  
}