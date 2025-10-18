import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/api/api.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';
import 'package:netflixclone/features/netflix/domain/entity/movie/movie_details.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/bottom_nav_bar_widget.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/main_action_button.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/moviedetails_screen/user_choice_action_button.dart';

class MovieDetailsScreen extends StatelessWidget {
  final MovieDetails movieDetails;
  const MovieDetailsScreen({super.key, required this.movieDetails});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.download)),
            IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          ],
        ),
        backgroundColor: AppColors.otherBgColor,
        body: SingleChildScrollView(
          child: Column(
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
                            movieDetails.runTime,
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
                    Row(
                      children: [
                        UserChoiceActionButton(
                          icon: Icons.add,
                          label: 'My List',
                        ),
                        UserChoiceActionButton(
                          icon: Icons.thumb_up_alt_outlined,
                          label: 'Rate',
                        ),
                        UserChoiceActionButton(
                          icon: Icons.share,
                          label: 'Share',
                        ),
                      ],
                    ),
                    TrailerAndRecommends(id: movieDetails.id),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBarWidget(isPreviewScreen: true),
      ),
    );
  }
}

class TrailerAndRecommends extends StatelessWidget {
  final int id;

  const TrailerAndRecommends({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(top: 35),
        child: Column(
          children: [
            TabBar(
              labelColor: AppColors.whiteColor,
              indicator: UnderlineTabIndicator(
                borderSide: BorderSide(width: 4, color: AppColors.redColor),
                insets: EdgeInsetsGeometry.symmetric(horizontal: width * 0.3),
              ),
              tabs: [
                Tab(text: 'More like this'),
                Tab(text: 'Trailers & More'),
              ],
            ),
            Container(
              width: double.infinity,
              child: TabBarView(
                children: [
                  GridView.count(
                    physics: NeverScrollableScrollPhysics(),
                    crossAxisCount: 3,
                    children: List.generate(
                      50,
                      (index) => CachedNetworkImage(
                        fit: BoxFit.cover,
                        width: width * 0.3,
                        height: 200,
                        imageUrl:
                            'https://image.tmdb.org/t/p/original/j6M2odS1RqGEUPKirIvB1VZ9i6Y.jpg',
                      ),
                    ),
                  ),
                  Text("hai"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
