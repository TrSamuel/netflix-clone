import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:netflixclone/features/netflix/core/api/api.dart';
import 'package:netflixclone/features/netflix/data/model/movie/movie_details_model/movie_details_model.dart';
import 'package:netflixclone/features/netflix/data/model/movie/movie_model/movie_model.dart';
import 'package:netflixclone/features/netflix/core/utils/movie_category.dart';
import 'package:http/http.dart' as http;

class MovieApiService {
  MovieApiService.internal();

  static MovieApiService instance = MovieApiService.internal();
  factory MovieApiService() => instance;

  Future<List<MovieModel>> getMovies(MovieCategory cateogry) async {
    try {
      final String url;

      switch (cateogry) {
        case MovieCategory.nowPlaying:
          url = '${Api.movieBaseUrl}/now_playing?api_key=${Api.key}';

        case MovieCategory.popular:
          url = '${Api.movieBaseUrl}/popular?api_key=${Api.key}';
        case MovieCategory.topRated:
          url = '${Api.movieBaseUrl}/top_rated?api_key=${Api.key}';
        case MovieCategory.upcoming:
          url = '${Api.movieBaseUrl}/upcoming?api_key=${Api.key}';
        case MovieCategory.trendingDay:
          url = '${Api.trendingMovieBaseUrl}/day?api_key=${Api.key}';
        case MovieCategory.trendingWeek:
          url = '${Api.trendingMovieBaseUrl}/week?api_key=${Api.key}';
        case MovieCategory.comedy:
          url = '${Api.discoverMovieBaseURl}?api_key=${Api.key}&with_genres=35';
        case MovieCategory.malayalam:
          url =
              '${Api.discoverMovieBaseURl}?api_key=${Api.key}&with_original_language=ml';
        case MovieCategory.english:
          url =
              '${Api.discoverMovieBaseURl}?api_key=${Api.key}&with_original_language=en';
        case MovieCategory.romantic:
          url =
              '${Api.discoverMovieBaseURl}?api_key=${Api.key}&with_genres=10749';
        case MovieCategory.thriller:
          url = '${Api.discoverMovieBaseURl}?api_key=${Api.key}&with_genres=53';
        case MovieCategory.horror:
          url = '${Api.discoverMovieBaseURl}?api_key=${Api.key}&with_genres=27';
        case MovieCategory.family:
          url =
              '${Api.discoverMovieBaseURl}?api_key=${Api.key}&with_genres=10751';
        case MovieCategory.action:
          url = '${Api.discoverMovieBaseURl}?api_key=${Api.key}&with_genres=28';
        case MovieCategory.animation:
          url = '${Api.discoverMovieBaseURl}?api_key=${Api.key}&with_genres=16';
        case MovieCategory.scifiFantasy:
          url =
              '${Api.discoverMovieBaseURl}?api_key=${Api.key}&with_genres=878,14';
      }

      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        debugPrint('${cateogry.name} movies : successful response');

        final json = jsonDecode(response.body);

        final results = json['results'] as List;

        return results.map((json) => MovieModel.fromJson(json)).toList();
      }
      if (response.statusCode == 401) {
        debugPrint(
          ' Cannot fetch ${cateogry.name} movies because of invalid api key',
        );
      }
      if (response.statusCode == 503) {
        debugPrint(
          '${cateogry.name} movies: This service is temporarily offline, try again later.',
        );
      }

      return [];
    } catch (e) {
      debugPrint('Failed to fetch ${cateogry.name} movies: $e');
      return [];
    }
  }

  Future<MovieDetailsModel?> getMovieDetails(int id) async {
    try {
      final response = await http.get(
        Uri.parse(
          '${Api.movieBaseUrl}/$id?api_key=${Api.key}&append_to_response=credits,translations,release_dates',
        ),
      );
      if (response.statusCode == 200) {
        debugPrint('fetch movie details : successful response');

        final json = jsonDecode(response.body);

        return MovieDetailsModel.fromJson(json);
      }
      if (response.statusCode == 401) {
        debugPrint(' Cannot fetch movie details because of invalid api key');
      }
      if (response.statusCode == 503) {
        debugPrint(
          'movies details: This service is temporarily offline, try again later.',
        );
      }
      return null;
    } catch (e) {
      debugPrint('Failed to fetch movie details: $e');
      return null;
    }
  }

  Future<List<MovieModel>> getRecommendMovies(int id) async {
    try {
      final String url =
          '${Api.movieBaseUrl}/$id/recommendations?api_key=${Api.key}';
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        debugPrint('recommend movies : successful response');

        final json = jsonDecode(response.body);

        final results = json['results'] as List;

        return results.map((json) => MovieModel.fromJson(json)).toList();
      }
      if (response.statusCode == 401) {
        debugPrint(
          ' Cannot fetch recommend movies  movies because of invalid api key',
        );
      }
      if (response.statusCode == 503) {
        debugPrint(
          'recommend movies  movies: This service is temporarily offline, try again later.',
        );
      }

      return [];
    } catch (e) {
      debugPrint('Failed to fetch recommend movies  movies: $e');
      return [];
    }
  }
}
