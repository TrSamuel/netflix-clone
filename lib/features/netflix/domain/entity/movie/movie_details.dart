class MovieDetails {
  final bool adult;
  final String backdropPath;
  final List<String> genres;
  final int id;
  final String title;
  final String originalTitle;
  final String overview;
  final DateTime releaseDate;
  final String tagline;

  MovieDetails({
    required this.adult,
    required this.backdropPath,
    required this.genres,
    required this.id,
    required this.title,
    required this.originalTitle,
    required this.overview,
    required this.releaseDate,
    required this.tagline,
  });
}
