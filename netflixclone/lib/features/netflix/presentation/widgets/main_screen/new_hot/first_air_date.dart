import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';
import 'package:netflixclone/features/netflix/domain/entity/tv_show/tv_show.dart';

class FirstAirDate extends StatelessWidget {
  const FirstAirDate({super.key, required this.tvShow});

  final TvShow tvShow;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.2,
      child: Column(
        children: [
          Text(
            DateFormat('MMM').format(tvShow.firstAirDate_!).toUpperCase(),
            style: TextStyle(color: AppColors.whiteColor),
          ),
          Text(
            "${tvShow.firstAirDate_!.day}",
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
