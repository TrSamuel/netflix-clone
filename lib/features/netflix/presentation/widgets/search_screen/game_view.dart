import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/utils/cache_manager.dart';
import 'package:netflixclone/features/netflix/domain/entity/game/game.dart';
import 'package:netflixclone/features/netflix/presentation/provider/search_provider.dart';

class GameView extends StatelessWidget {
  final SearchProvider search;
  const GameView({super.key, required this.search});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      childAspectRatio: 1 / 1,
      children: List.generate(search.games.length, (index) {
        final Game game = search.games[index];
        if (game.thumbnail.isEmpty) {
          return SizedBox.shrink();
        }

        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(
                    cacheManager: customCacheManager,
                    game.thumbnail,
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
