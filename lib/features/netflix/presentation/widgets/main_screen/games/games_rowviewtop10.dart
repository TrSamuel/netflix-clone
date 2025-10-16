import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/utils/game_category.dart';
import 'package:netflixclone/features/netflix/domain/entity/game/game.dart';
import 'package:netflixclone/features/netflix/presentation/service/game_fetcher.dart';

class GamesRowviewtop10 extends StatelessWidget {
  const GamesRowviewtop10({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FutureBuilder(
        future: GameFetcher.getGames(GameCategory.all),
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
                        children: [
                          SizedBox(width: 10),
                          Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  const Color.fromARGB(255, 79, 79, 79),
                                  Colors.grey,
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
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
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(
                                      gamesList[index].thumbnail,
                                    ),
                                  ),
                                ),
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
