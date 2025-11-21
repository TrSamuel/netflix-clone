import 'package:netflixclone/features/netflix/core/utils/game_category.dart';
import 'package:netflixclone/features/netflix/data/source/game_api_service.dart';
import 'package:netflixclone/features/netflix/domain/entity/game/game.dart';
import 'package:netflixclone/features/netflix/domain/entity/game/game_details.dart';
import 'package:netflixclone/features/netflix/domain/repository/game_repo.dart';

class GameRepoImp extends GameRepo {
  GameRepoImp.internal();

  static GameRepoImp instance = GameRepoImp.internal();

  factory GameRepoImp() => instance;

  final GameApiService _gameApiService = GameApiService.instance;

  @override
  Future<List<Game>> getGames(GameCategory category) async {
    return await _gameApiService.getGames(category);
  }

  @override
  Future<GameDetails?> getGameDetails(int id) async => await _gameApiService.getGameDetails(id);
}
