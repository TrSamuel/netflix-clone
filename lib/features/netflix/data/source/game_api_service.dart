import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:netflixclone/features/netflix/core/api/api.dart';
import 'package:netflixclone/features/netflix/core/utils/game_category.dart';
import 'package:netflixclone/features/netflix/data/model/game/game_model.dart';
import 'package:http/http.dart' as http;

class GameApiService {
  GameApiService.internal();

  static GameApiService instance = GameApiService.internal();
  factory GameApiService() => instance;

  Future<List<GameModel>> getGames(GameCategory cateogry) async {
    try {
      final String type;

      switch (cateogry) {
        case GameCategory.anime:
          type = 'anime';
        case GameCategory.shooter:
          type = 'shooter';
        case GameCategory.racing:
          type = 'racing';
        case GameCategory.sports:
          type = 'sports';
        case GameCategory.fighting:
          type = 'fighting';
        case GameCategory.card:
          type = 'card';
        case GameCategory.fantacy:
          type = 'fantacy';
      }

      final response = await http.get(
        Uri.parse('${Api.gameUrl}=$type'),
      );

      if (response.statusCode == 200) {
        debugPrint('${cateogry.name} games : successful response');

        final results = jsonDecode(response.body) as List;

        return results.map((json) => GameModel.fromJson(json)).toList();
      }
      if (response.statusCode == 503) {
        debugPrint(
          '${cateogry.name} games: This service is temporarily offline, try again later.',
        );
      }

      return [];
    } catch (e) {
      debugPrint('Failed to fetch ${cateogry.name} games: $e');
      return [];
    }
  }
}
