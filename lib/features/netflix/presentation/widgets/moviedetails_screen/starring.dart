import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';
import 'package:netflixclone/features/netflix/domain/entity/movie/movie_details.dart';
import 'package:netflixclone/features/netflix/presentation/screens/more_view_screens/movie_moreview_screen.dart';

class Starring extends StatelessWidget {
  const Starring({super.key, required this.movieDetails});

  final MovieDetails movieDetails;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 3,
          child: Text(
            "Starring: ${movieDetails.cast.take(3).join(', ')}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: AppColors.greyColor),
          ),
        ),
        Flexible(
          flex: 1,
          child: TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      MovieMoreviewScreen(movieDetails: movieDetails),
                ),
              );
            },
            style: TextButton.styleFrom(foregroundColor: AppColors.whiteColor),
            child: Text("more"),
          ),
        ),
      ],
    );
  }
}
