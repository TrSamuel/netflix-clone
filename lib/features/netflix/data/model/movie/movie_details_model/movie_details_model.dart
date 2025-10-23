import 'package:json_annotation/json_annotation.dart';
import 'package:netflixclone/features/netflix/domain/entity/movie/movie_details.dart';

import 'belongs_to_collection.dart';
import 'credits.dart';
import 'genre.dart';
import 'production_company.dart';
import 'production_country.dart';
import 'release_dates.dart';
import 'spoken_language.dart';
import 'translations.dart';

part 'movie_details_model.g.dart';

@JsonSerializable()
class MovieDetailsModel extends MovieDetails {
  @override
  bool? adult;
  @override
  @JsonKey(name: 'backdrop_path')
  String? backdropPath;
  @JsonKey(name: 'belongs_to_collection')
  BelongsToCollection? belongsToCollection;
  int? budget;
  List<Genre>? genrs;
  String? homepage;
  @override
  int? id;
  @JsonKey(name: 'imdb_id')
  String? imdbId;
  @JsonKey(name: 'origin_country')
  List<String>? originCountry;
  @JsonKey(name: 'original_language')
  String? originalLanguage;
  @override
  @JsonKey(name: 'original_title')
  String? originalTitle;
  @override
  String? overview;
  double? popularity;
  @JsonKey(name: 'poster_path')
  String? posterPath;
  @JsonKey(name: 'production_companies')
  List<ProductionCompany>? productionCompanies;
  @JsonKey(name: 'production_countries')
  List<ProductionCountry>? productionCountries;
  @JsonKey(name: 'release_date')
  String? releasDate;
  int? revenue;
  int? runtime;
  @JsonKey(name: 'spoken_languages')
  List<SpokenLanguage>? spokenLanguages;
  String? status;
  @override
  String? tagline;
  @override
  String? title;
  @override
  bool? video;
  @JsonKey(name: 'vote_average')
  double? voteAverage;
  @JsonKey(name: 'vote_count')
  int? voteCount;
  Credits? credits;
  Translations? translations;
  @JsonKey(name: 'release_dates')
  ReleaseDates? releaseDates;

  MovieDetailsModel({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genrs,
    this.homepage,
    this.id,
    this.imdbId,
    this.originCountry,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releasDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
    this.credits,
    this.translations,
    this.releaseDates,
  }) : super(
         adult: adult,
         backdropPath: backdropPath,
         genres: genrs?.map((g) => g.name).toList() ?? [],
         id: id,
         title: title,
         originalTitle: originalTitle,
         overview: overview,
        releaseDate: releasDate != null ? DateTime.tryParse(releasDate) : null,
         tagline: tagline,
        runTime: runtime != null
        ? (runtime % 60 != 0
            ? '${runtime ~/ 60}h ${runtime % 60}m'
            : '${runtime ~/ 60}h')
        : 'N/A',
         video: false,
         cast: credits!.cast==null?[]:credits.cast!.map((c) => c.name).toList(),
         director: credits.crew!
             .where((c) => c.department == 'Directing')
             .map((c) => c.name)
             .toList()
             .first,
         writers: credits.crew!
             .where((c) => c.department == 'Writing')
             .map((c) => c.name)
             .toList(),
         languages: translations!.translations!
             .map((t) => t.englishName)
             .toList(),
         maturityRating: releaseDates!.results!
             .where((r) => r.iso31661 == 'IN')
             .map((r) => r.releaseDates!.last.certification)
             .join(', ')
             .replaceAll('()', ''),
       );

  factory MovieDetailsModel.fromJson(Map<String, dynamic> json) {
    return _$MovieDetailsModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$MovieDetailsModelToJson(this);
}
