import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/utils/movie_category.dart';
import 'package:netflixclone/features/netflix/core/utils/tv_show_category.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/games/hero_card_home.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/home/item_row_view.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/home/item_row_view_top10.dart';

class Gamespage extends StatelessWidget {
  const Gamespage({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.only(top: width * 0.4),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: AlignmentGeometry.bottomCenter,
            end: Alignment.topCenter,
            colors: [Colors.black, Colors.blueGrey],
          ),
        ),
        child: Column(
          children: [
            HeroCardGame(width: width),
            ItemRowView(
              movieCategory: MovieCategory.nowPlaying,
              title: 'Now Playing Movies',
            ),
            ItemRowView(
              movieCategory: MovieCategory.trendingDay,
              title: 'Trending Movies Today',
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
            ItemRowView(
              tvShowCategory: TvShowCategory.onTheAir,
              title: 'TV Shows On The Air',
            ),
            ItemRowView(
              tvShowCategory: TvShowCategory.popular,
              title: 'Popular TV Shows',
            ),
            ItemRowView(
              tvShowCategory: TvShowCategory.topRated,
              title: 'Top Rated TV Shows',
            ),
            ItemRowView(
              tvShowCategory: TvShowCategory.trendingWeek,
              title: 'Weekly Trending TV Shows',
            ),
              ItemRowView(
              movieCategory: MovieCategory.popular,
              title: 'Popular Movies',
            ),
          ],
        ),
      ),
    );
  }
}

