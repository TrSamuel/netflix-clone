import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/api/api.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';
import 'package:netflixclone/features/netflix/core/utils/cache_manager.dart';
import 'package:netflixclone/features/netflix/domain/entity/movie/movie.dart';
import 'package:netflixclone/features/netflix/domain/entity/tv_show/tv_show.dart';
import 'package:netflixclone/features/netflix/presentation/provider/search_provider.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/search_screen/compined_view.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/search_screen/recommend_games.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/search_screen/recommend_shows_movies.dart';
import 'package:provider/provider.dart';

class SeachScreen extends StatelessWidget {
  const SeachScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.otherBgColor,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.download))],
        bottom: PreferredSize(
          preferredSize: Size(MediaQuery.sizeOf(context).width, 50),
          child: SearchBar(
            controller: searchController,
            textStyle: WidgetStatePropertyAll(
              TextStyle(color: AppColors.whiteColor),
            ),
            onChanged: (query) {
              context.read<SearchProvider>().getQuery(query);
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
              Consumer<SearchProvider>(
                builder: (context, search, _) => search.isSearching
                    ? IconButton(
                        onPressed: () {
                          searchController.clear();
                          search.clear();
                        },
                        icon: Icon(Icons.close),
                        color: AppColors.greyColor,
                      )
                    : IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.mic_none_outlined),
                        color: AppColors.greyColor,
                      ),
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Consumer<SearchProvider>(
          builder: (context, search, child) => !search.isSearching
              ? Column(children: [RecommendGames(), RecommendShowsMovies()])
              : Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: search.movies.isNotEmpty || search.tvShows.isNotEmpty
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8, bottom: 5),
                              child: Text(
                                "Movies & TV",
                                style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            CompinedView(search: search),
                          ],
                        )
                      : Padding(
                          padding: const EdgeInsets.all(18.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Oops. We haven't got that.",
                                style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 10),
                              Text(
                                "Try searching for another movies, shows, actor, director or genre",
                                style: TextStyle(
                                  fontSize: 18,
                                  color: const Color.fromARGB(
                                    255,
                                    122,
                                    122,
                                    122,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                ),
        ),
      ),
    );
  }
}
