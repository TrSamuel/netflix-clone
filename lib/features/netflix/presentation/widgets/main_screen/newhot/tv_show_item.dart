import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/domain/entity/api/tv_show/tv_show.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/newhot/about_and_img.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/newhot/first_air_date.dart';

class TvShowItem extends StatelessWidget {
  const TvShowItem({super.key, required this.tvShow});

  final TvShow tvShow;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FirstAirDate(tvShow: tvShow),
            AboutAndImg(tvShow: tvShow),
          ],
        ),
        Container(height: 20),
      ],
    );
  }
}
