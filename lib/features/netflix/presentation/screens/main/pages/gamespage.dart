import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';
import 'package:netflixclone/features/netflix/core/utils/movie_category.dart';
import 'package:netflixclone/features/netflix/core/utils/tv_show_category.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/games/games_rowview.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/games/hero_card_game.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/home/item_row_view.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/home/item_row_view_top10.dart';

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
            GamesRowview(
              title: 'Card games',
              movieCategory: MovieCategory.popular,
            ),
            GamesRowview(
              title: 'Card games',
              movieCategory: MovieCategory.popular,
            ),
          ],
        ),
      ),
    );
  }
}
