class MovieDetails {
  final String? backdropPath_;
  final List<String?> genres_;
  final int? id_;
  final String? title_;
  final String? originalTitle_;
  final String? overview_;
  final DateTime? releaseDate_;
  final String? tagline_;
  final String? runTime_;
  final bool? video_;
  final List<String?> cast_;
  final List<String?> writers_;
  final String? director_;
  final List<String?> languages_;
  final String? maturityRating_;

  MovieDetails({
    required this.backdropPath_,
    required this.genres_,
    required this.id_,
    required this.title_,
    required this.originalTitle_,
    required this.overview_,
    required this.releaseDate_,
    required this.tagline_,
    required this.runTime_,
    required this.video_,
    required this.cast_,
    required this.writers_,
    required this.director_,
    required this.languages_,
    required this.maturityRating_,
  });
}
