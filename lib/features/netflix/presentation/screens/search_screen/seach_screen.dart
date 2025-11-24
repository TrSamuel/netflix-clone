import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/api/api.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';
import 'package:netflixclone/features/netflix/core/utils/cache_manager.dart';
import 'package:netflixclone/features/netflix/domain/entity/movie/movie.dart';
import 'package:netflixclone/features/netflix/presentation/provider/search_provider.dart';
import 'package:netflixclone/features/netflix/presentation/service/search.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/search_screen/recommend_games.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/search_screen/recommend_shows_movies.dart';
import 'package:provider/provider.dart';

class SeachScreen extends StatelessWidget {
  const SeachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.otherBgColor,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.download))],
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.sizeOf(context).width, 50),
          child: SearchBar(
            textStyle: WidgetStatePropertyAll(
              TextStyle(color: AppColors.whiteColor),
            ),
            onChanged: (query) {
              if (query.trim().isNotEmpty) {
                context.read<SearchProvider>().getQuery(query);
              }
            },
            hintText: 'Search games,shows,mo...',
            hintStyle: WidgetStatePropertyAll(
              TextStyle(color: AppColors.greyColor),
            ),
            backgroundColor: WidgetStatePropertyAll(
              const Color.fromARGB(255, 26, 26, 26),
            ),
            shape: WidgetStatePropertyAll(LinearBorder()),
            leading: Icon(Icons.search, color: AppColors.greyColor),
            trailing: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.mic_none_outlined),
                color: AppColors.greyColor,
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<SearchProvider>(
          builder: (context, search, child) => search.query.isEmpty
              ? Column(children: [RecommendGames(), RecommendShowsMovies()])
              : FutureBuilder(
                  future: Search.movies(search.query),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData ||
                        snapshot.hasError ||
                        snapshot.data!.isEmpty) {
                      return Text(
                        "No movies",
                        style: TextStyle(color: AppColors.whiteColor),
                      );
                    }

                    final List<Movie> movies = snapshot.data!;

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Wrap(
                        children: List.generate(movies.length, (index) {
                          final movie = movies[index];

                          return (movie.posterPath_ == null ||
                                  movie.posterPath_!.isNotEmpty)
                              ? Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Container(
                                    width: 100,
                                    height: 150,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: CachedNetworkImageProvider(
                                          cacheManager: customCacheManager,
                                          '${Api.imageBaseUrl}/${movie.posterPath_}',
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              : SizedBox.shrink();
                        }),
                      ),
                    );
                  },
                ),
        ),
      ),
    );
  }
}
