import 'package:netflixclone/features/netflix/domain/entity/game/game_details.dart';

class GameDetailsModel extends GameDetails {
  GameDetailsModel({
    required super.title,
    required super.descr,
    required super.genre,
    required super.thumbnail,
    required super.screenshots,
    required super.url,
    required super.releaseDate,
    required super.developer,
  });

  factory GameDetailsModel.fromJson(Map<String, dynamic> json) {
    final screenshotUrls = (json['screenshots'] as List?)
            ?.map((e) => e['image'] as String? ?? '')
            .where((e) => e.isNotEmpty)
            .toList() ??
        [];

    return GameDetailsModel(
      title: json['title'] ?? '',
      descr: json['short_description'] ?? '',
      genre: json['genre'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      screenshots: screenshotUrls,
      url: json['game_url'] ?? '',
      releaseDate: DateTime.tryParse(json['release_date'] ?? '') ??
          DateTime(2000, 1, 1),
      developer: json['developer'] ?? '',
    );
  }
}
