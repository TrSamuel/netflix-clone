import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/api/api.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';
import 'package:netflixclone/features/netflix/core/utils/cache_manager.dart';
import 'package:netflixclone/features/netflix/core/utils/movie_category.dart';
import 'package:netflixclone/features/netflix/domain/entity/movie/movie.dart';
import 'package:netflixclone/features/netflix/domain/entity/movie/movie_details.dart';
import 'package:netflixclone/features/netflix/presentation/screens/moviedetails_screen/movie_details_screen.dart';
import 'package:netflixclone/features/netflix/presentation/service/movie_fetcher.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/custom_nav.dart';

class RecommendShowsMovies extends StatelessWidget {
  const RecommendShowsMovies({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: MovieFetcher.getMovies(MovieCategory.trendingDay),
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.hasError || snapshot.data!.isEmpty) {
          return SizedBox.shrink();
        }
        final List<Movie> movies = snapshot.data!;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Recommended Shows & Movies",
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            Column(
              children: List.generate(movies.length, (index) {
                final movie = movies[index];
                return Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: InkWell(
                    onTap: () async {
                      final MovieDetails? movieDetails =
                          await MovieFetcher.getMovieDetails(movie.id_!);
                      if (movieDetails != null) {
                        Navigator.push(
                          context,
                          CustomNav(
                            page: MovieDetailsScreen(
                              movieDetails: movieDetails,
                            ),
                          ),
                        );
                      }
                    },
                    child: Row(
                      children: [
                        Container(
                          width: 150,
                          height: 80,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(
                                '${Api.imageBaseUrl}/${movie.backdroppath_!}',
                                cacheManager: customCacheManager,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        SizedBox(
                          width: 150,
                          child: Text(
                            movie.title_!,
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Spacer(),
                        Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(
                              width: 1,
                              color: AppColors.whiteColor,
                            ),
                          ),
                          child: Icon(
                            Icons.play_arrow,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        );
      },
    );
  }
}
