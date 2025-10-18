import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';
import 'package:netflixclone/features/netflix/core/utils/game_category.dart';
import 'package:netflixclone/features/netflix/domain/entity/game/game.dart';
import 'package:netflixclone/features/netflix/presentation/service/game_fetcher.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/games/dummy_items_game.dart';

class GamesRowview extends StatelessWidget {
  final String title;
  final GameCategory category;
  const GamesRowview({super.key, required this.title, required this.category});

  @override
  Widget build(BuildContext context) {
    final future = GameFetcher.getGames(category);
    return SizedBox(
      width: double.infinity,
      child: FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return DummyItemsGame(title: title);
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
                    children: List.generate(
                      gamesList.length,
                      (index) => Row(
                        children: [
                          SizedBox(width: 10),
                          Column(
                            children: [
                              CachedNetworkImage(
                                width: 100,
                                height: 100,
                                memCacheHeight: 200,
                                memCacheWidth: 200,
                                imageUrl: gamesList[index].thumbnail,
                                placeholder: (context, url) => Container(
                                  decoration: BoxDecoration(
                                    gradient: LinearGradient(
                                      colors: [Colors.black, Colors.blueGrey],
                                    ),
                                  ),
                                  child: Center(
                                    child: SizedBox(
                                      width: 16,
                                      height: 16,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                ),
                                errorWidget: (context, url, error) => Icon(
                                  Icons.error,
                                  color: const Color.fromARGB(255, 29, 28, 28),
                                ),
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
          }
        
      ),
    );
  }
}
