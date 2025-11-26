import 'package:hive_flutter/hive_flutter.dart';
import 'package:netflixclone/features/netflix/domain/entity/hive/movie_d.dart';
part 'movie_d_model.g.dart';

@HiveType(typeId: 1)
class MovieDModel extends MovieD{
  @HiveField(0)
  final int id_;
  @HiveField(1)
  final String backdropPath_;
  @HiveField(2)
  final String title_;

  MovieDModel({
    required this.id_,
    required this.backdropPath_,
    required this.title_,
  }):super(id: id_,backdropPath: backdropPath_,title: title_);
}
