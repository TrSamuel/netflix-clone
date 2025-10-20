import 'package:netflixclone/features/netflix/domain/entity/tv_show/tv_show.dart';

class TvShowModel extends TvShow {
  TvShowModel({required super.id, required super.posterPath});

  factory TvShowModel.fromJson(Map<String, dynamic> json) {
    return TvShowModel(
      id: json["id"] ?? 0,
      posterPath: json["poster_path"] ?? '',
    );
  }
}
