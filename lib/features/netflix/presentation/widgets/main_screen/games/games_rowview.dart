import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';
import 'package:netflixclone/features/netflix/core/utils/game_category.dart';
import 'package:netflixclone/features/netflix/domain/entity/game/game.dart';
import 'package:netflixclone/features/netflix/presentation/service/game_fetcher.dart';

class GamesRowview extends StatelessWidget {
  final String title;
  final GameCategory category;
  const GamesRowview({super.key, required this.title, required this.category});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FutureBuilder(
        future: GameFetcher.getGames(category),
        builder: (context, snapshot) {
          if (!snapshot.hasData ||
              snapshot.hasError ||
              snapshot.data!.isEmpty) {
            return SizedBox.shrink();
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Row(
              children: List.generate(
                10,
                (index) => Column(
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
                          10,
                          (index) => Row(
                            children: [
                              SizedBox(width: 10),
                              Container(
                                width: 100,
                                height: 150,
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: [
                                      const Color.fromARGB(255, 40, 40, 40),
                                      const Color.fromARGB(255, 66, 66, 66),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
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
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      gamesList[index].thumbnail,
                                    ),
                                  ),
                                ),
                              ),
                              Container(
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
        },
      ),
    );
  }
}
