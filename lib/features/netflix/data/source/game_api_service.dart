import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:netflixclone/features/netflix/core/api/api.dart';
import 'package:netflixclone/features/netflix/core/utils/game_category.dart';
import 'package:netflixclone/features/netflix/data/model/game/game_details_model.dart';
import 'package:netflixclone/features/netflix/data/model/game/game_model.dart';
import 'package:http/http.dart' as http;
import 'package:netflixclone/features/netflix/domain/entity/game/game.dart';

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
        case GameCategory.fantasy:
          type = 'fantasy';
        case GameCategory.strategy:
          type = 'strategy';
        case GameCategory.sciFi:
          type = 'sci-fi';
        case GameCategory.moba:
          type = 'moba';
        case GameCategory.mmorpg:
          type = 'mmorpg';
        case GameCategory.battleRoyale:
          type = 'battle-royale';
        case GameCategory.all:
          type = '';
      }

      final url = type.isEmpty ? Api.gamesBaseUrl : '${Api.gamesFindUrl}=$type';

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        debugPrint('${cateogry.name} games : successful response');

        final results = jsonDecode(response.body) as List;

        return results.map((json) => GameModel.fromJson(json)).toList();
      }
      if (response.statusCode == 404) {
        debugPrint('${cateogry.name} Games not found.');
      }
      if (response.statusCode == 500) {
        debugPrint('${cateogry.name} Games- server error');
      }
      if (response.statusCode == 522) {
        debugPrint('${cateogry.name} Games- Connection Timed Out');
      }

      return [];
    } catch (e) {
      debugPrint('Failed to fetch ${cateogry.name} games: $e');
      return [];
    }
  }

  Future<GameDetailsModel?> getGameDetails(int id) async {
    try {
      final response = await http.get(
        Uri.parse('${Api.gameDetailsUrl}?id=$id'),
      );

      if (response.statusCode == 200) {
        debugPrint('game details got successful');

        final json = jsonDecode(response.body);

        return GameDetailsModel.fromJson(json);
      }
      if (response.statusCode == 404) {
        debugPrint('game details not found');
        return null;
      }
      if (response.statusCode == 500) {
        debugPrint('fetch game details- server error');
        return null;
      }
    } catch (e) {
      debugPrint('Failed to fetch game details: $e');
      return null;
    }
    return null;
  }

  Future<List<GameModel>> searchGames(String query) async {
    try {
      final response = await http.get(Uri.parse(Api.gamesBaseUrl));

      if (response.statusCode == 200) {
        debugPrint('search games : successful response');

        final searchedList = (jsonDecode(response.body) as List).map((json) => GameModel.fromJson(json))
            .toList();
        return searchedList
            .where(
              (game) => game.title.toLowerCase().startsWith(query.toString()),
            )
            .toList();
      }
      if (response.statusCode == 404) {
        debugPrint('search Games not found.');
      }
      if (response.statusCode == 500) {
        debugPrint('search Games- server error');
      }
      if (response.statusCode == 522) {
        debugPrint('search Games- Connection Timed Out');
      }

      return [];
    } catch (e) {
      debugPrint('Failed to fetch search games: $e');
      return [];
    }
  }
}
