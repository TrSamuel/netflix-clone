class MovieDetails {
  final bool? adult;
  final String? backdropPath;
  final List<String?> genres;
  final int? id;
  final String? title;
  final String? originalTitle;
  final String? overview;
  final DateTime? releaseDate;
  final String? tagline;
  final String? runTime;
  final bool? video;
  final List<String?> cast;
  final List<String?> writers;
  final String? director;
  final List<String?> languages;
  final String? maturityRating;

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
    required this.runTime,
    required this.video,
    required this.cast,
    required this.writers,
    required this.director,
    required this.languages,
    required this.maturityRating,
  });
}
