import 'package:netflixclone/features/netflix/domain/repository/dowload_repo.dart';

class DelMovie {
  final DowloadRepo repo;

  DelMovie({required this.repo});

  Future<void>  call(int id)=> repo.delMovie(id);
}