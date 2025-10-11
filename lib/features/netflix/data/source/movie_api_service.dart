import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:netflixclone/features/netflix/core/api/api.dart';
import 'package:netflixclone/features/netflix/data/model/movie/movie_model.dart';
import 'package:netflixclone/features/netflix/core/utils/movie_category.dart';
import 'package:http/http.dart' as http;

class MovieApiService {
  MovieApiService.internal();

  static MovieApiService instance = MovieApiService.internal();
  factory MovieApiService() => instance;

  Future<List<MovieModel>> getMovies(MovieCategory cateogry) async {
    try {
      final String url;

      if (cateogry == MovieCategory.trendingDay ||
          cateogry == MovieCategory.trendingWeek) {
        url = Api.trendingMovieBaseUrl;
      } else {
        url = Api.movieBaseUrl;
      }

      final String type;

      switch (cateogry) {
        case MovieCategory.trendingDay:
          type = 'day';
          break;
        case MovieCategory.trendingWeek:
          type = 'week';
          break;

        case MovieCategory.nowPlaying:
          type = 'now_playing';
          break;
        case MovieCategory.popular:
          type = 'popular';
          break;
        case MovieCategory.topRated:
          type = 'top_rated';
          break;
        case MovieCategory.upcoming:
          type = 'upcoming';
          break;
      }

      final response = await http.get(
        Uri.parse('$url/$type?api_key=${Api.key}'),
      );

      if (response.statusCode == 200) {
        debugPrint('${cateogry.name} movies : successful response');

        final json = jsonDecode(response.body);

        final results = json['results'] as List;

        return results.map((json) => MovieModel.fromJson(json)).toList();
      }
      if (response.statusCode == 401) {
        debugPrint(' Cannot fetch ${cateogry.name} movies because of invalid api key');
      }
      if (response.statusCode == 503) {
        debugPrint('${cateogry.name} movies: This service is temporarily offline, try again later.');
      }

      return [];
    } catch (e) {
      debugPrint('Failed to fetch ${cateogry.name} movies: $e');
      return [];
    }
  }
}
