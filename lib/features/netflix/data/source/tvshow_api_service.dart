import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:netflixclone/features/netflix/core/api/api.dart';
import 'package:netflixclone/features/netflix/core/utils/tv_show_category.dart';
import 'package:netflixclone/features/netflix/data/model/tv_show/tv_show_details_model/tv_show_details_model.dart';
import 'package:netflixclone/features/netflix/data/model/tv_show/tv_show_model/tv_show_model.dart';

class TvshowApiService {
  TvshowApiService.internal();
  static TvshowApiService instance = TvshowApiService.internal();
  factory TvshowApiService() => instance;

  Future<List<TvShowModel>> getTvShows(TvShowCategory category) async {
    try {
      final String url;

      if (category == TvShowCategory.trendingDay ||
          category == TvShowCategory.trendingWeek) {
        url = Api.trendingTvBaseUrl;
      } else {
        url = Api.tvBaseUrl;
      }

      final String type;

      switch (category) {
        case TvShowCategory.trendingDay:
          type = 'day';
          break;
        case TvShowCategory.trendingWeek:
          type = 'week';
          break;

        case TvShowCategory.airingToday:
          type = 'airing_today';
          break;
        case TvShowCategory.onTheAir:
          type = 'on_the_air';
          break;
        case TvShowCategory.popular:
          type = 'popular';
          break;
        case TvShowCategory.topRated:
          type = 'top_rated';
          break;
      }

      final response = await http.get(
        Uri.parse('$url/$type?api_key=${Api.key}'),
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


  Future<TvShowDetailsModel?>  getTvShowDetails(int id) async {
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
