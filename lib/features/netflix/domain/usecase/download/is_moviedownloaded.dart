import 'package:netflixclone/features/netflix/domain/repository/dowload_repo.dart';

class IsMoviedownloaded {
  final DowloadRepo dowloadRepo;

  IsMoviedownloaded({required this.dowloadRepo});

  bool call(int id)=>dowloadRepo.isMovieDownloaded(id);
}