import 'package:netflixclone/features/netflix/core/utils/game_category.dart';
import 'package:netflixclone/features/netflix/data/source/game_api_service.dart';
import 'package:netflixclone/features/netflix/domain/entity/game/game.dart';
import 'package:netflixclone/features/netflix/domain/repository/game_repo.dart';

class GameRepoImp extends GameRepo {
  GameRepoImp.internal();

  static GameRepoImp instance = GameRepoImp.internal();

  factory GameRepoImp() => instance;

  final GameApiService _gameApiService = GameApiService.instance;

  @override
  Future<List<Game>> animeGames() async {
    return await _gameApiService.getGames(GameCategory.anime);
  }

  @override
  Future<List<Game>> cardGames() async {
    return await _gameApiService.getGames(GameCategory.card);
  }

  @override
  Future<List<Game>> fanctacyGames() async {
    return await _gameApiService.getGames(GameCategory.fantacy);
  }

  @override
  Future<List<Game>> fightingGames() async {
    return await _gameApiService.getGames(GameCategory.fighting);
  }

  @override
  Future<List<Game>> racingGames() async {
    return await _gameApiService.getGames(GameCategory.racing);
  }

  @override
  Future<List<Game>> shooterGames() async {
    return await _gameApiService.getGames(GameCategory.shooter);
  }

  @override
  Future<List<Game>> sportsGames() async {
    return await _gameApiService.getGames(GameCategory.sports);
  }
}
