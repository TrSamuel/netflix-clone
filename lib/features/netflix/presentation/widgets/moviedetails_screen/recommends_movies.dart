import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/api/api.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';
import 'package:netflixclone/features/netflix/core/utils/cache_manager.dart';
import 'package:netflixclone/features/netflix/domain/entity/api/movie/movie.dart';
import 'package:netflixclone/features/netflix/domain/entity/api/movie/movie_details.dart';
import 'package:netflixclone/features/netflix/presentation/screens/moviedetails_screen/movie_details_screen.dart';
import 'package:netflixclone/features/netflix/presentation/service/movie_fetcher.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/custom_nav.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/loading_item_container.dart';

class RecommendsMovies extends StatefulWidget {
  final MovieDetails movieDetails;

  const RecommendsMovies({super.key, required this.movieDetails});

  @override
  State<RecommendsMovies> createState() => _RecommendsMoviesState();
}

class _RecommendsMoviesState extends State<RecommendsMovies>
    with AutomaticKeepAliveClientMixin {
  late Future<List<Movie>> future;
  @override
  void initState() {
    super.initState();
    future = MovieFetcher.getRecommendMovies(widget.movieDetails.id_!);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.only(top: 35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'More like this',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor,
            ),
          ),
          SizedBox(
            width: double.infinity,
            height: size.height * 0.82,
            child: FutureBuilder(
              future: future,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return GridView.count(
                    crossAxisCount: 3,
                    physics: NeverScrollableScrollPhysics(),
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                    childAspectRatio: 1 / 1.5,
                    children: List.generate(
                      12,
                      (index) => LoadingItemContainer(),
                    ),
                  );
                }

                if (!snapshot.hasData ||
                    snapshot.hasError ||
                    snapshot.data == null ||
                    snapshot.data!.isEmpty) {
                  return SizedBox.shrink();
                }

                final List<Movie> movies = snapshot.data!;
                return Wrap(
                  runSpacing: 8,
                  spacing: 8,
                  children: List.generate(
                    12,
                    (index) => movies[index].posterPath_ != null
                        ? GestureDetector(
                            onTap: () async {
                              final MovieDetails? movieDetails =
                                  await MovieFetcher.getMovieDetails(
                                    (movies[index].id_!),
                                  );
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
                            child: CachedNetworkImage(
                              cacheManager: customCacheManager,
                              memCacheHeight: 200,
                              fit: BoxFit.cover,
                              width: size.width * 0.3,
                              height: 200,
                              imageUrl:
                                  '${Api.imageBaseUrl}/${movies[index].posterPath_}',
                            ),
                          )
                        : SizedBox.shrink(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
