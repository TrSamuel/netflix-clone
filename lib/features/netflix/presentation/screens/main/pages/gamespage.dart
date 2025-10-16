import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';
import 'package:netflixclone/features/netflix/core/utils/game_category.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/games/games_rowview.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/games/hero_card_game.dart';

class Gamespage extends StatelessWidget {
  const Gamespage({super.key, required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: width * .25),
        decoration: BoxDecoration(color: AppColors.otherBgColor),
        child: Column(
          children: [
            HeroCardGame(width: width),

            GamesRowview(title: 'Card games', category: GameCategory.card),
            GamesRowview(title: 'Anime games', category: GameCategory.anime),
            GamesRowview(
              title: 'Fantasy games',
              category: GameCategory.fantasy,
            ),
            GamesRowview(
              title: 'Fighting games',
              category: GameCategory.fighting,
            ),
            GamesRowview(title: 'Racing games', category: GameCategory.racing),
            GamesRowview(
              title: 'Shooter games',
              category: GameCategory.shooter,
            ),
            GamesRowview(title: 'Sci-Fi games', category: GameCategory.sciFi),
            GamesRowview(
              title: 'Strategy games',
              category: GameCategory.strategy,
            ),
            GamesRowview(title: 'MOBA games', category: GameCategory.moba),
            GamesRowview(title: 'MMORPG games', category: GameCategory.mmorpg),
            GamesRowview(
              title: 'Battle Royale games',
              category: GameCategory.battleRoyale,
            ),
          ],
        ),
      ),
    );
  }
}
