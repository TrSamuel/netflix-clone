import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/api/api.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';
import 'package:netflixclone/features/netflix/domain/entity/movie/movie_details.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/bottom_nav_bar_widget.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/main_action_button.dart';

class MovieDetailsScreen extends StatelessWidget {
  final MovieDetails movieDetails;
  const MovieDetailsScreen({super.key, required this.movieDetails});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.download)),
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
        ],
      ),
      backgroundColor: AppColors.otherBgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CachedNetworkImage(
            width: double.infinity,
            height: 200,
            fit: BoxFit.cover,
            imageUrl: '${Api.imageBaseUrl}/${movieDetails.backdropPath}',
            placeholder: (context, url) => Container(
              color: AppColors.otherBgColor,
              child: Center(
                child: Text(
                  movieDetails.originalTitle,
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            errorWidget: (context, url, error) => Container(
              color: AppColors.otherBgColor,
              child: Center(
                child: Text(
                  movieDetails.originalTitle,
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.italic,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
         
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  movieDetails.title,
                  style: TextStyle(
                    color: AppColors.whiteColor,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  width: width * .4,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${movieDetails.releaseDate.year}',
                        style: TextStyle(color: AppColors.whiteColor),
                      ),
                      Text(
                        movieDetails.adult ? 'A' : "U/A 16+",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          backgroundColor: AppColors.greyColor,
                        ),
                      ),
                      Text(
                        "2h 34h",
                        style: TextStyle(color: AppColors.whiteColor),
                      ),
                    ],
                  ),
                ),

                MainActionButton(
                  width: width,
                  icon: Icons.play_arrow,
                  label: 'Play',
                  bgColor: AppColors.whiteColor,
                  fgColor: AppColors.otherBgColor,
                ),
                MainActionButton(
                  width: width,
                  icon: Icons.download,
                  label: 'Download',
                  bgColor: AppColors.greyColor,
                  fgColor: AppColors.whiteColor,
                ),
                Text(
                  movieDetails.overview,
                  style: TextStyle(
                    fontSize: 16,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavBarWidget(isPreviewScreen: true),
    );
  }
}
