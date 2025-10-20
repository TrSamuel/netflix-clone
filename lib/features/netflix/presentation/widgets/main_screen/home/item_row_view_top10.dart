import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/api/api.dart';
import 'package:netflixclone/features/netflix/core/utils/cache_manager.dart';
import 'package:netflixclone/features/netflix/core/utils/movie_category.dart';
import 'package:netflixclone/features/netflix/core/utils/tv_show_category.dart';
import 'package:netflixclone/features/netflix/domain/entity/movie/movie.dart';
import 'package:netflixclone/features/netflix/domain/entity/movie/movie_details.dart';
import 'package:netflixclone/features/netflix/domain/entity/tv_show/tv_show.dart';
import 'package:netflixclone/features/netflix/presentation/screens/moviedetails_screen/movie_details_screen.dart';
import 'package:netflixclone/features/netflix/presentation/service/movie_fetcher.dart';
import 'package:netflixclone/features/netflix/presentation/service/tvshow_fetcher.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/custom_nav.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/home/dummy_items_home.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/loading_item_container.dart';

class ItemRowViewTop10 extends StatelessWidget {
  final MovieCategory? movieCategory;
  final TvShowCategory? tvShowCategory;
  final String title;
  const ItemRowViewTop10({
    super.key,
    this.movieCategory,
    this.tvShowCategory,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    final future = movieCategory != null
        ? MovieFetcher.getMovies(movieCategory!)
        : TvshowFetcher.getTvShows(tvShowCategory!);
    return SizedBox(
      width: double.infinity,
      child: FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return DummyItemsHome(title: title);
          }
          if (!snapshot.hasData ||
              snapshot.hasError ||
              snapshot.data!.isEmpty) {
            return SizedBox.shrink();
          }
          final List rowItemList = snapshot.data!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(10, (index) {
                    final bool imgStatus;
                    if (movieCategory != null) {
                      imgStatus =
                          (rowItemList[index] as Movie).posterPath.isNotEmpty;
                    } else {
                      imgStatus =
                          (rowItemList[index] as TvShow).posterPath.isNotEmpty;
                    }
                    return imgStatus
                        ? Row(
                            children: [
                              SizedBox(width: 10),
                              Stack(
                                alignment: Alignment.bottomLeft,
                                children: [
                                  Text(
                                    "${index + 1}",

                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 54,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 35),
                                    child: GestureDetector(
                                      onTap: () async {
                                        if (movieCategory != null) {
                                          final MovieDetails? movieDetails =
                                              await MovieFetcher.getMovieDetails(
                                                (rowItemList[index] as Movie)
                                                    .id,
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
                                        }
                                      },
                                      child: CachedNetworkImage(
                                        cacheManager: customCacheManager,
                                        width: 100,
                                        height: 150,
                                        memCacheHeight: 300,
                                        memCacheWidth: 200,
                                        imageUrl:
                                            '${Api.imageBaseUrl}/${movieCategory != null ? (rowItemList[index] as Movie).posterPath : (rowItemList[index] as TvShow).posterPath}',
                                        placeholder: (context, url) =>
                                            LoadingItemContainer(),
                                        errorWidget: (context, url, error) =>
                                           LoadingItemContainer(),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          )
                        : SizedBox.shrink();
                  }),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

