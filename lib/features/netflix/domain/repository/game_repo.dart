import 'package:netflixclone/features/netflix/core/utils/game_category.dart';
import 'package:netflixclone/features/netflix/domain/entity/game/game.dart';

abstract class GameRepo {
  Future<List<Game>> getGames(GameCategory category);
}
