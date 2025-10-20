import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/utils/cache_manager.dart';
import 'package:netflixclone/features/netflix/core/utils/game_category.dart';
import 'package:netflixclone/features/netflix/domain/entity/game/game.dart';
import 'package:netflixclone/features/netflix/presentation/service/game_fetcher.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/games/dummy_items_game.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/loading_item_container.dart';

class GamesRowviewtop10 extends StatelessWidget {
  const GamesRowviewtop10({super.key});

  @override
  Widget build(BuildContext context) {
    final future = GameFetcher.getGames(GameCategory.all);
    return SizedBox(
      width: double.infinity,
      child: FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return DummyItemsGame(title: 'Top 10 Mobile Games');
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
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'Top 10 Mobile Games',
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
                  children: List.generate(
                    10,
                    (index) => Row(
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
                              child: CachedNetworkImage(
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
