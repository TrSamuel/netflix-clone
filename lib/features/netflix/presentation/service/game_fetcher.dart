import 'package:netflixclone/features/netflix/core/utils/game_category.dart';
import 'package:netflixclone/features/netflix/data/repository/game_repo_imp.dart';
import 'package:netflixclone/features/netflix/domain/entity/api/game/game.dart';
import 'package:netflixclone/features/netflix/domain/entity/api/game/game_details.dart';
import 'package:netflixclone/features/netflix/domain/usecase/game/get_gamedetails.dart';
import 'package:netflixclone/features/netflix/domain/usecase/game/get_games.dart';

class GameFetcher {
  static final GetGames getGamesuseCase = GetGames(
    gameRepo: GameRepoImp.instance,
  );

  static final GetGamedetails getGamedetailUse=GetGamedetails(gameRepo: GameRepoImp.instance);

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
      case GameCategory.fantasy:
        return await getGamesuseCase(GameCategory.fantasy);
      case GameCategory.strategy:
        return await getGamesuseCase(GameCategory.strategy);
      case GameCategory.sciFi:
        return await getGamesuseCase(GameCategory.sciFi);
      case GameCategory.moba:
        return await getGamesuseCase(GameCategory.moba);
      case GameCategory.mmorpg:
        return await getGamesuseCase(GameCategory.mmorpg);
      case GameCategory.battleRoyale:
        return await getGamesuseCase(GameCategory.battleRoyale);
      case GameCategory.all:
        return await getGamesuseCase(GameCategory.all);
    }
  }

  static Future<GameDetails?> getGamedetails(int id) async => await getGamedetailUse(id);
}
