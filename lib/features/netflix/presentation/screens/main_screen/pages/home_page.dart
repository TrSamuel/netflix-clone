import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';
import 'package:netflixclone/features/netflix/core/utils/game_category.dart';
import 'package:netflixclone/features/netflix/core/utils/movie_category.dart';
import 'package:netflixclone/features/netflix/core/utils/tv_show_category.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/games/games_rowview.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/games/games_rowviewtop10.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/home/hero_card_home.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/home/item_row_view.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/home/item_row_view_top10.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.width});

  final double width;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: widget.width * 0.4),
        decoration: BoxDecoration(color: AppColors.homeBgColor),
        child: Column(
          children: [
            HeroCardHome(width: widget.width),

            ItemRowView(
              movieCategory: MovieCategory.nowPlaying,
              title: 'Now Playing Movies',
            ),
            ItemRowView(
              movieCategory: MovieCategory.animation,
              title: 'Animation Movies',
            ),
            ItemRowView(
              movieCategory: MovieCategory.trendingDay,
              title: 'Trending Movies Today',
            ),
            ItemRowView(
              movieCategory: MovieCategory.comedy,
              title: 'Comedy Movies',
            ),
            GamesRowview(
              category: GameCategory.all,
              title: "Mobile games",
              isSeeAll: true,
            ),
            ItemRowView(
              movieCategory: MovieCategory.upcoming,
              title: 'Upcoming Movies',
            ),
            ItemRowViewTop10(
              title: 'Top 10 TV Shows Today',
              tvShowCategory: TvShowCategory.trendingDay,
            ),
            ItemRowView(
              movieCategory: MovieCategory.malayalam,
              title: 'Malayalam-Language Movies',
            ),
            ItemRowView(
              movieCategory: MovieCategory.topRated,
              title: 'Top Rated Movies',
            ),
            ItemRowView(
              tvShowCategory: TvShowCategory.airingToday,
              title: 'TV Shows Airing Today',
            ),
            ItemRowViewTop10(
              title: 'Top 10 Weekly Trending Movies',
              movieCategory: MovieCategory.trendingWeek,
            ),
            GamesRowviewtop10(),
            ItemRowView(
              tvShowCategory: TvShowCategory.onTheAir,
              title: 'TV Shows On The Air',
            ),
            ItemRowView(
              movieCategory: MovieCategory.english,
              title: 'English Movies',
            ),
            ItemRowView(
              tvShowCategory: TvShowCategory.popular,
              title: 'Popular TV Shows',
            ),
            ItemRowView(
              movieCategory: MovieCategory.family,
              title: 'Family Movies',
            ),
            ItemRowView(
              tvShowCategory: TvShowCategory.topRated,
              title: 'Top Rated TV Shows',
            ),
            ItemRowView(
              movieCategory: MovieCategory.horror,
              title: 'Horror Movies',
            ),
            ItemRowView(
              tvShowCategory: TvShowCategory.trendingWeek,
              title: 'Weekly Trending TV Shows',
            ),
            ItemRowView(
              movieCategory: MovieCategory.romantic,
              title: 'Romantic Movies',
            ),
            ItemRowView(
              movieCategory: MovieCategory.popular,
              title: 'Popular Movies',
            ),
            ItemRowView(
              movieCategory: MovieCategory.scifiFantasy,
              title: 'Sci-Fi & Fantasy Movies',
            ),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
