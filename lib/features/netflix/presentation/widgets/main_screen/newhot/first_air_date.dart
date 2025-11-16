import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';
import 'package:netflixclone/features/netflix/domain/entity/tv_show/tv_show.dart';

class FirstAirDate extends StatelessWidget {
  const FirstAirDate({super.key, required this.tvShow});

  final TvShow tvShow;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.15,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            DateFormat('MMM').format(tvShow.firstAirDate_!).toUpperCase(),
            style: GoogleFonts.kanit(color: AppColors.whiteColor),
          ),
          Text(
            "${tvShow.firstAirDate_!.day}",
            style: GoogleFonts.archivoBlack(
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
