import 'package:netflixclone/features/domain/entity/movie/movie.dart';

class MovieModel extends Movie {
  final int id_;
  MovieModel({required this.id_}) : super(id: id_);
}
