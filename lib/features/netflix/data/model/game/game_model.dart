import 'package:netflixclone/features/netflix/domain/entity/game/game.dart';

class GameModel extends Game {
  GameModel({
    required super.id,
    required super.title,
    required super.thumbnail,
    required super.genre,
  });

  factory GameModel.fromJson(Map<String, dynamic> json) => GameModel(
    id: json['id'] ?? 0,
    title: json['title'] ?? '',
    thumbnail: json['thumbnail'] ?? '',
    genre: json['genre'] ?? '',
  );
}
