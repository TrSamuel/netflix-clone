import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/api/api.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';
import 'package:netflixclone/features/netflix/core/utils/cache_manager.dart';
import 'package:netflixclone/features/netflix/domain/entity/movie/movie.dart';
import 'package:netflixclone/features/netflix/domain/entity/movie/movie_details.dart';
import 'package:netflixclone/features/netflix/presentation/service/movie_fetcher.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/bottom_nav_bar_widget.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/custom_nav.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/loading_item_container.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/main_action_button.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/moviedetails_screen/user_choice_action_button.dart';

class MovieDetailsScreen extends StatelessWidget {
  final MovieDetails movieDetails;
  const MovieDetailsScreen({super.key, required this.movieDetails});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.download)),
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          ],
        ),
        backgroundColor: AppColors.otherBgColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CachedNetworkImage(
                cacheManager: customCacheManager,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                imageUrl: '${Api.imageBaseUrl}/${movieDetails.backdropPath!}',
                placeholder: (context, url) => Container(
                  color: AppColors.otherBgColor,
                  child: Center(
                    child: Text(
                      movieDetails.originalTitle!,
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  color: AppColors.otherBgColor,
                  child: Center(
                    child: Text(
                      movieDetails.originalTitle!,
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      movieDetails.title!,
                      style: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: width * .4,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '${movieDetails.releaseDate!.year}',
                            style: TextStyle(color: AppColors.whiteColor),
                          ),
                          Text(
                            movieDetails.adult! ? 'A' : "U/A 16+",
                            style: TextStyle(
                              color: AppColors.whiteColor,
                              backgroundColor: AppColors.greyColor,
                            ),
                          ),
                          Text(
                            movieDetails.runTime!,
                            style: TextStyle(color: AppColors.whiteColor),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Watch in ${movieDetails.languages.take(2).join(' and ')}",
                      style: TextStyle(color: AppColors.whiteColor),
                    ),
                    MainActionButton(
                      width: width,
                      icon: Icons.play_arrow,
                      label: 'Play',
                      bgColor: AppColors.whiteColor,
                      fgColor: AppColors.otherBgColor,
                    ),
                    MainActionButton(
                      width: width,
                      icon: Icons.download,
                      label: 'Download',
                      bgColor: AppColors.greyColor,
                      fgColor: AppColors.whiteColor,
                    ),
                    Text(
                      movieDetails.overview!,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Starring(movieDetails: movieDetails),
                    Text(
                      "Director: ${movieDetails.director!}",
                      style: TextStyle(color: AppColors.greyColor),
                    ),
                    Row(
                      children: [
                        UserChoiceActionButton(
                          icon: Icons.add,
                          label: 'My List',
                        ),
                        UserChoiceActionButton(
                          icon: Icons.thumb_up_alt_outlined,
                          label: 'Rate',
                        ),
                        UserChoiceActionButton(
                          icon: Icons.share,
                          label: 'Share',
                        ),
                      ],
                    ),
                    TrailerAndRecommends(movieDetails: movieDetails),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBarWidget(isPreviewScreen: true),
      ),
    );
  }
}

class Starring extends StatelessWidget {
  const Starring({super.key, required this.movieDetails});

  final MovieDetails movieDetails;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 3,
          child: Text(
            "Starring: ${movieDetails.cast.take(3).join(', ')}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: AppColors.greyColor),
          ),
        ),
        Flexible(
          flex: 1,
          child: TextButton(
            onPressed: () {},
            style: TextButton.styleFrom(foregroundColor: AppColors.whiteColor),
            child: Text("more"),
          ),
        ),
      ],
    );
  }
}

class TrailerAndRecommends extends StatelessWidget {
  final MovieDetails movieDetails;

  const TrailerAndRecommends({super.key, required this.movieDetails});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.only(top: 35),
      child: Column(
        children: [
          TabBar(
            labelColor: AppColors.whiteColor,
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 4, color: AppColors.redColor),
              insets: EdgeInsetsGeometry.symmetric(
                horizontal: size.width * 0.3,
              ),
            ),
            tabs: [
              Tab(text: 'More like this'),
              Tab(text: 'Trailers & More'),
            ],
          ),
          SizedBox(
            width: double.infinity,
            height: size.height * 0.82,
            child: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                FutureBuilder(
                  future: MovieFetcher.getRecommendMovies(movieDetails.id!),
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
                        snapshot.data!.isEmpty) {
                      return SizedBox.shrink();
                    }

                    final List<Movie> movies = snapshot.data!;
                    return Wrap(
                      runSpacing: 8,
                      spacing: 8,
                      children: List.generate(
                        12,
                        (index) => movies[index].posterPath != null
                            ? GestureDetector(
                                onTap: () async {
                                  final MovieDetails? movieDetails =
                                      await MovieFetcher.getMovieDetails(
                                        (movies[index].id!),
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
                                      '${Api.imageBaseUrl}/${movies[index].posterPath}',
                                ),
                              )
                            : SizedBox.shrink(),
                      ),
                    );
                  },
                ),
                movieDetails.video!
                    ? CachedNetworkImage(
                        imageUrl:
                            '${Api.imageBaseUrl}/${movieDetails.backdropPath}',
                      )
                    : Text("data"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
