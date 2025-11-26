import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:netflixclone/features/netflix/data/model/api/movie/movie_details_model/movie_details_model.dart';
import 'package:netflixclone/features/netflix/data/model/hive/movie_d_model.dart';

class DowloadDb {
  DowloadDb.internal();

  static DowloadDb instance = DowloadDb.internal();
  factory DowloadDb() => instance;

  late final Box<MovieDModel> movieBox;

  initDb() async {
    await Hive.initFlutter();
    if (!Hive.isAdapterRegistered(MovieDModelAdapter().typeId)) {
      Hive.registerAdapter(MovieDModelAdapter());
    }
    movieBox = await Hive.openBox<MovieDModel>('moviebox.db');
  }

  dowloadMovie(MovieDetailsModel movie) async {
    try {
      final MovieDModel movieDModel = MovieDModel(
        id_: movie.id!,
        backdropPath_: movie.backdropPath ?? '',
        title_: movie.title ?? '',
      );
      await movieBox.put(movieDModel.id_, movieDModel);
      debugPrint("movie ${movie.title} is downloaded");
    } catch (e) {
      debugPrint("error to dowload movie: $e");
    }
  } 

  Future<List<MovieDModel>> getMovies() async {
    try {
      return movieBox.values.toList();
    } catch (e) {
      debugPrint("error to getmovies: $e");
      return [];
    }
  }

  bool isMovieDowloaded(int id) => movieBox.containsKey(id);

  removeMovie(int id) async {
    try {
      await movieBox.delete(id);
      debugPrint("movie deleted");
    } catch (e) {
      debugPrint("error to delete movie: $e");
    }
  }
}
