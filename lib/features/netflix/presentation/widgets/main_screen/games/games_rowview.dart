import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';
import 'package:netflixclone/features/netflix/core/utils/cache_manager.dart';
import 'package:netflixclone/features/netflix/core/utils/game_category.dart';
import 'package:netflixclone/features/netflix/domain/entity/game/game.dart';
import 'package:netflixclone/features/netflix/presentation/provider/bottomnav_provider.dart';
import 'package:netflixclone/features/netflix/presentation/service/game_fetcher.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/games/dummy_items_game.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/loading_item_container.dart';
import 'package:provider/provider.dart';

class GamesRowview extends StatelessWidget {
  final String title;
  final GameCategory category;
  final bool isSeeAll;
  const GamesRowview({
    super.key,
    required this.title,
    required this.category,
    this.isSeeAll = false,
  });

  @override
  Widget build(BuildContext context) {
    final future = GameFetcher.getGames(category);
    return SizedBox(
      width: double.infinity,
      child: FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return DummyItemsGame(title: title, isSeeAll: isSeeAll);
          }
          if (!snapshot.hasData ||
              snapshot.hasError ||
              snapshot.data!.isEmpty) {
            return SizedBox.shrink();
          }
          final List<Game> gamesList = snapshot.data!;
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                  if (isSeeAll)
                    TextButton.icon(
                      onPressed: () {
                        Provider.of<BottomnavProvider>(context,listen: false).changeIndex(1);
                      },
                      label: Text("See All"),
                      icon: Icon(Icons.arrow_forward_ios),
                      style: TextButton.styleFrom(
                        iconAlignment: IconAlignment.end,
                        textStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        foregroundColor: AppColors.whiteColor,
                      ),
                    ),
                ],
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    gamesList.length,
                    (index) => Row(
                      children: [
                        SizedBox(width: 10),
                        Column(
                          children: [
                            CachedNetworkImage(
                              cacheManager: customCacheManager,
                              width: 100,
                              height: 100,
                              memCacheHeight: 200,
                              memCacheWidth: 200,
                              imageUrl: gamesList[index].thumbnail,
                              placeholder: (context, url) =>
                                  LoadingItemContainer(),
                              errorWidget: (context, url, error) =>
                                  LoadingItemContainer(),
                              fit: BoxFit.cover,
                            ),

                            SizedBox(
                              width: 100,
                              child: Text(
                                overflow: TextOverflow.fade,
                                maxLines: 1,
                                gamesList[index].title,
                                style: TextStyle(
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            Text(
                              gamesList[index].genre,
                              style: TextStyle(color: AppColors.whiteColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
