import 'package:netflixclone/features/netflix/domain/entity/movie/movie_details.dart';

class MovieDetailsModel extends MovieDetails {
  MovieDetailsModel({
    required super.adult,
    required super.backdropPath,
    required super.genres,
    required super.id,
    required super.title,
    required super.originalTitle,
    required super.overview,
    required super.releaseDate,
    required super.tagline,
    required super.runTime,
  });

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) =>
      MovieDetailsModel(
        adult: json['adult'] ?? false,
        backdropPath: json['backdrop_path'] ?? '',
        genres:
            (json['genres'] as List?)
                ?.map((g) => g['name'] as String)
                .toList() ??
            [],
        id: json['id'] ?? 0,
        title: json['title'] ?? '',
        originalTitle: json['original_title'] ?? '',
        overview: json['overview'] ?? '',
        releaseDate: json['release_date'] == null
            ? DateTime.now()
            : DateTime.parse(json['release_date']),
        tagline: json['tagline'] ?? '',
        runTime: json['runtime']==null ? '':getTime(json['runtime'] as int),
      );

 static String getTime(int time) {
    int hr = time ~/ 60;
    int min = time % 60;

    return min == 0 ? '${hr}h' : '${hr}h ${min}m';
  }
}
