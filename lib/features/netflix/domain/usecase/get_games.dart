import 'package:netflixclone/features/netflix/core/utils/game_category.dart';
import 'package:netflixclone/features/netflix/domain/entity/game/game.dart';
import 'package:netflixclone/features/netflix/domain/repository/game_repo.dart';

class GetGames {
  final GameRepo gameRepo;

  GetGames({required this.gameRepo});

  Future<List<Game>> call(GameCategory category) {
    switch (category) {
      case GameCategory.anime:
        return gameRepo.animeGames();
      case GameCategory.shooter:
        return gameRepo.shooterGames();
      case GameCategory.racing:
        return gameRepo.racingGames();
      case GameCategory.sports:
        return gameRepo.sportsGames();
      case GameCategory.fighting:
        return gameRepo.fightingGames();
      case GameCategory.card:
        return gameRepo.cardGames();
      case GameCategory.fantacy:
        return gameRepo.fanctacyGames();
    }
  }
}
