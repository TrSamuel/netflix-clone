import 'package:netflixclone/features/netflix/domain/entity/game/game_details.dart';
import 'package:netflixclone/features/netflix/domain/repository/game_repo.dart';

class GetGamedetails {
  final GameRepo gameRepo;

  GetGamedetails({required this.gameRepo});
  

  Future<GameDetails?>  call(int id)=>gameRepo.getGameDetails(id);
}