import 'package:netflixclone/features/netflix/core/utils/game_category.dart';
import 'package:netflixclone/features/netflix/domain/entity/game/game.dart';
import 'package:netflixclone/features/netflix/domain/repository/game_repo.dart';

class GetGames {
  final GameRepo gameRepo;

  GetGames({required this.gameRepo});

  Future<List<Game>> call(GameCategory category) {
        return gameRepo.getGames(category);
  }
}
