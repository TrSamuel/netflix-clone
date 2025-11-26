import 'package:netflixclone/features/netflix/core/utils/game_category.dart';
import 'package:netflixclone/features/netflix/domain/entity/api/game/game.dart';
import 'package:netflixclone/features/netflix/domain/entity/api/game/game_details.dart';

abstract class GameRepo {
  Future<List<Game>> getGames(GameCategory category);
  Future<GameDetails?>  getGameDetails(int id);
  Future<List<Game>>  searchgames(String query);
}
