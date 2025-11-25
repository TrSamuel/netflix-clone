import 'package:netflixclone/features/netflix/domain/entity/game/game.dart';
import 'package:netflixclone/features/netflix/domain/repository/game_repo.dart';

class SearchGames {
  final GameRepo gameRepo;

  SearchGames({required this.gameRepo});

  Future<List<Game>> call(String query)=>gameRepo.searchgames(query);
}