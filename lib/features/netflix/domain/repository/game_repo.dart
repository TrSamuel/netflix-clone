import 'package:netflixclone/features/netflix/core/utils/game_category.dart';
import 'package:netflixclone/features/netflix/domain/entity/game/game.dart';
import 'package:netflixclone/features/netflix/domain/entity/game/game_details.dart';

abstract class GameRepo {
  Future<List<Game>> getGames(GameCategory category);
  Future<GameDetails?>  getGameDetails(int id);
}
