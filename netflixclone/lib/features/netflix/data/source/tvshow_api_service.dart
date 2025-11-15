import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:netflixclone/features/netflix/core/api/api.dart';
import 'package:netflixclone/features/netflix/core/utils/tv_show_category.dart';
import 'package:netflixclone/features/netflix/data/model/tv_show/tv_episode_model/tv_episode_model.dart';
import 'package:netflixclone/features/netflix/data/model/tv_show/tv_show_details_model/tv_show_details_model.dart';
import 'package:netflixclone/features/netflix/data/model/tv_show/tv_show_model/tv_show_model.dart';
import 'package:netflixclone/features/netflix/domain/entity/tv_show/episode.dart';

class TvshowApiService {
  TvshowApiService.internal();
  static TvshowApiService instance = TvshowApiService.internal();
  factory TvshowApiService() => instance;

  Future<List<TvShowModel>> getTvShows(TvShowCategory category) async {
    try {
      final String url;

      switch (category) {
        case TvShowCategory.trendingDay:
          url = '${Api.trendingTvBaseUrl}/day?api_key=${Api.key}';
        case TvShowCategory.trendingWeek:
          url = '${Api.trendingTvBaseUrl}/week?api_key=${Api.key}';
        case TvShowCategory.airingToday:
          url = '${Api.tvBaseUrl}/airing_today?api_key=${Api.key}';
        case TvShowCategory.onTheAir:
          url = '${Api.tvBaseUrl}/on_the_air?api_key=${Api.key}';
        case TvShowCategory.popular:
          url = '${Api.tvBaseUrl}/popular?api_key=${Api.key}';
        case TvShowCategory.topRated:
          url = '${Api.tvBaseUrl}/top_rated?api_key=${Api.key}';
        case TvShowCategory.family:
          url = '${Api.discoverTvBaseUrl}?api_key=${Api.key}&with_genres=10751';
        case TvShowCategory.comingSoon:
          url =
              '${Api.discoverTvBaseUrl}?api_key=${Api.key}'
              '&language=en-US'
              '&sort_by=first_air_date.asc'
              '&first_air_date.gte=${DateTime.now().add(Duration(days: 1)).toIso8601String().split('T').first}';
      }

      final response = await http.get(
        Uri.parse(url),
      );

      if (response.statusCode == 200) {
        debugPrint('${category.name} tvshows: successful response');

        final json = jsonDecode(response.body);

        final results = json['results'] as List;

        return results.map((json) => TvShowModel.fromJson(json)).toList();
      }
      if (response.statusCode == 401) {
        debugPrint(
          ' Cannot fetch ${category.name} tv shows because of invalid api key',
        );
      }
      if (response.statusCode == 503) {
        debugPrint(
          '${category.name} tvshows: This service is temporarily offline, try again later.',
        );
      }

      return [];
    } catch (e) {
      debugPrint('Failed to fetch ${category.name} tvshows: $e');
      return [];
    }
  }

  Future<TvShowDetailsModel?> getTvShowDetails(int id) async {
    try {
      final response = await http.get(
        Uri.parse(
          '${Api.tvBaseUrl}/$id?api_key=${Api.key}&append_to_response=credits,content_ratings',
        ),
      );
      if (response.statusCode == 200) {
        debugPrint('fetch tvshow details : successful response');

        final json = jsonDecode(response.body);

        return TvShowDetailsModel.fromJson(json);
      }
      if (response.statusCode == 401) {
        debugPrint(' Cannot fetch tvshow details because of invalid api key');
      }
      if (response.statusCode == 503) {
        debugPrint(
          'tvshow details: This service is temporarily offline, try again later.',
        );
      }
      return null;
    } catch (e) {
      debugPrint('Failed to fetch tvshow details: $e');
      return null;
    }
  }

  Future<List<Episode>> getEpisodes(int seriesId, int seasonId) async {
    try {
      final String url =
          '${Api.tvBaseUrl}/$seriesId/season/$seasonId?api_key=${Api.key}';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        debugPrint('Season $seasonId - Episodes : successful response');

        final json = jsonDecode(response.body);

        final results = json["episodes"] as List;

        return results.map((json) => TvEpisodeModel.fromJson(json)).toList();
      }
      if (response.statusCode == 401) {
        debugPrint(
          'Cannot fetch Season $seasonId - Episodes : because of invalid api key',
        );
      }
      if (response.statusCode == 503) {
        debugPrint(
          'Season $seasonId - Episodes: This service is temporarily offline, try again later.',
        );
      }

      return [];
    } catch (e) {
      debugPrint('Failed to fetch Season $seasonId - Episodes: $e');
      return [];
    }
  }

  Future<List<TvShowModel>> getRecommTvShows(int id) async {
    try {
      final String url =
          '${Api.tvBaseUrl}/$id/recommendations?api_key=${Api.key}';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        debugPrint('recommend tvshows : successful response');

        final json = jsonDecode(response.body);

        final results = json['results'] as List;

        return results.map((json) => TvShowModel.fromJson(json)).toList();
      }
      if (response.statusCode == 401) {
        debugPrint(
          ' Cannot fetch recommend tvshows because of invalid api key',
        );
      }
      if (response.statusCode == 503) {
        debugPrint(
          'recommend tvshows: This service is temporarily offline, try again later.',
        );
      }

      return [];
    } catch (e) {
      debugPrint('Failed to fetch recommend tvshows: $e');
      return [];
    }
  }
}
