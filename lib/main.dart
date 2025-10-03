import 'package:flutter/material.dart';
import 'package:netflixclone/features/data/repository/movie_repo_imp.dart';
import 'package:netflixclone/features/domain/repository/movie_repo.dart';
import 'package:netflixclone/features/domain/usecase/get_movies.dart';
import 'package:netflixclone/features/presentation/provider/movie_provider.dart';
import 'package:netflixclone/features/presentation/screens/main/main_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(NetflixApp());
}

class NetflixApp extends StatelessWidget {
  const NetflixApp({super.key});

  @override
  Widget build(BuildContext context) {
    final MovieRepo movieRepo = MovieRepoImp();
    final GetMovies getMovies = GetMovies(movieRepo: movieRepo);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MovieProvider(getmovieUsecase: getMovies),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          outlinedButtonTheme: OutlinedButtonThemeData(
            style: OutlinedButton.styleFrom(
              minimumSize: Size(0, 36),
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              foregroundColor: Colors.white,
              side: BorderSide(width: 1, color: Colors.white),
            ),
          ),
          iconButtonTheme: IconButtonThemeData(
            style: IconButton.styleFrom(foregroundColor: Colors.white),
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    );
  }
}
