import 'package:netflixclone/features/netflix/domain/entity/tv_show/episode.dart';

class TvshowDetails {
  final int? id;
  final String? backdropPath;
  final DateTime? releaseDate;
  final String? maturityRating;
  final int? noOfSeasons;
  final String? name;
  final List<String?> casts;
  final List<String?> genres_;
  final String? originalName;
  final String? overview;
  final List<Episode?> episodes;

  TvshowDetails({
    required this.id,
    required this.backdropPath,
    required this.releaseDate,
    required this.maturityRating,
    required this.noOfSeasons,
    required this.name,
    required this.genres_,
    required this.originalName,
    required this.overview,
    required this.casts,
    required this.episodes,
  });
}
