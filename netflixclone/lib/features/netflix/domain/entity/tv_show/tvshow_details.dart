class TvshowDetails {
  final int? id_;
  final String? backdropPath_;
  final DateTime? releaseDate_;
  final String? maturityRating_;
  final int? noOfSeasons_;
  final String? name_;
  final String? creator_;
  final List<String?> casts_;
  final List<String?> genres_;
  final String? originalName_;
  final String? overview_;

  TvshowDetails({
    required this.id_,
    required this.backdropPath_,
    required this.releaseDate_,
    required this.maturityRating_,
    required this.noOfSeasons_,
    required this.name_,
    required this.genres_,
    required this.originalName_,
    required this.overview_,
    required this.creator_,
    required this.casts_,
  });
}
