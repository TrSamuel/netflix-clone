import 'package:netflixclone/features/netflix/domain/entity/game/game.dart';

abstract class GameRepo {
  Future<List<Game>> shooterGames();
  Future<List<Game>> animeGames();
  Future<List<Game>> racingGames();
  Future<List<Game>> sportsGames();
  Future<List<Game>> fightingGames();
  Future<List<Game>> cardGames();
  Future<List<Game>> fanctacyGames();
}
