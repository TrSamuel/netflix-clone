import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';
import 'package:netflixclone/features/netflix/domain/entity/api/movie/movie_details.dart';
import 'package:netflixclone/features/netflix/domain/entity/api/tv_show/tvshow_details.dart';
import 'package:netflixclone/features/netflix/presentation/screens/more_view_screen/movie_moreview_screen.dart';

class Starring extends StatelessWidget {
  const Starring({super.key, this.movieDetails, this.tvshowDetails});

  final MovieDetails? movieDetails;
  final TvshowDetails? tvshowDetails;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 3,
          child: Text(
            "Starring: ${movieDetails != null ? movieDetails!.cast_.take(3).join(', ') : tvshowDetails!.casts_.take(3).join(', ')}",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: AppColors.greyColor),
          ),
        ),
        Flexible(
          flex: 1,
          child: TextButton(
            onPressed: () {
              if (movieDetails != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MoreviewScreen(movieDetails: movieDetails!),
                  ),
                );
              } else {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        MoreviewScreen(tvshowDetails: tvshowDetails!),
                  ),
                );
              }
            },
            style: TextButton.styleFrom(foregroundColor: AppColors.whiteColor),
            child: Text("more"),
          ),
        ),
      ],
    );
  }
}
