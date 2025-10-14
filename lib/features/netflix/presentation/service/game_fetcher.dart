import 'package:netflixclone/features/netflix/core/utils/game_category.dart';
import 'package:netflixclone/features/netflix/data/repository/game_repo_imp.dart';
import 'package:netflixclone/features/netflix/domain/entity/game/game.dart';
import 'package:netflixclone/features/netflix/domain/usecase/get_games.dart';

class GameFetcher {
  static final GetGames getGamesuseCase = GetGames(
    gameRepo: GameRepoImp.instance,
  );

  static Future<List<Game>> getGames(GameCategory category) async {
    switch (category) {
      case GameCategory.anime:
        return await getGamesuseCase(GameCategory.anime);
      case GameCategory.shooter:
              return await getGamesuseCase(GameCategory.shooter);
      case GameCategory.racing:
              return await getGamesuseCase(GameCategory.racing);
      case GameCategory.sports:
             return await getGamesuseCase(GameCategory.sports);
      case GameCategory.fighting:
             return await getGamesuseCase(GameCategory.fighting);
      case GameCategory.card:
             return await getGamesuseCase(GameCategory.card);
      case GameCategory.fantacy:
             return await getGamesuseCase(GameCategory.fantacy);
    }
  }
}
