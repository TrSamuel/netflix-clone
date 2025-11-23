import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';
import 'package:netflixclone/features/netflix/core/utils/game_category.dart';
import 'package:netflixclone/features/netflix/domain/entity/game/game.dart';
import 'package:netflixclone/features/netflix/presentation/service/game_fetcher.dart';

class RecommendGames extends StatelessWidget {
  const RecommendGames({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: GameFetcher.getGames(GameCategory.all),
      builder: (context, snapshot) {
        if (!snapshot.hasData ||
            snapshot.hasError ||
            snapshot.data!.isEmpty) {
          return SizedBox.shrink();
        }
        final List<Game> games = snapshot.data!;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Recommended Mobile Games",
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(
                  games.length > 15 ? 15 : games.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      children: [
                        Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: CachedNetworkImageProvider(
                                games[index].thumbnail,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: 100,
                          child: Text(
                            games[index].title,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: AppColors.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
