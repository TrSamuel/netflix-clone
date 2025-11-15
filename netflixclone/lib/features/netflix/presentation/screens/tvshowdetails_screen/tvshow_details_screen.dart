import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/api/api.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';
import 'package:netflixclone/features/netflix/core/utils/cache_manager.dart';
import 'package:netflixclone/features/netflix/domain/entity/tv_show/tvshow_details.dart';
import 'package:netflixclone/features/netflix/presentation/provider/tvseason_selector.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/bottom_nav_bar_widget.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/main_action_button.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/moviedetails_screen/starring.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/moviedetails_screen/user_choice_action_button.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/tvshowdetails_screen/episodes_recommends.dart';
import 'package:provider/provider.dart';

class TvshowDetailsScreen extends StatelessWidget {
  final TvshowDetails tvshowDetails;
  const TvshowDetailsScreen({super.key, required this.tvshowDetails});

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
                cacheManager: customCacheManager,
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                imageUrl: '${Api.imageBaseUrl}/${tvshowDetails.backdropPath_!}',
                placeholder: (context, url) => Container(
                  color: AppColors.otherBgColor,
                  child: Center(
                    child: Text(
                      tvshowDetails.originalName_!,
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
                      tvshowDetails.originalName_!,
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
                      tvshowDetails.name_!,
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
                            '${tvshowDetails.releaseDate_!.year}',
                            style: TextStyle(color: AppColors.whiteColor),
                          ),
                          Container(
                            color: AppColors.greyColor,
                            padding: EdgeInsets.all(2),
                            child: Text(
                              tvshowDetails.maturityRating_!.isNotEmpty
                                  ? tvshowDetails.maturityRating_!
                                  : 'U/A 16+',
                              style: TextStyle(color: AppColors.whiteColor),
                            ),
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
                      tvshowDetails.overview_!,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Starring(tvshowDetails: tvshowDetails),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
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
                        Consumer<TvseasonSelector>(
                          builder: (context, instance, child) =>
                              UserChoiceActionButton(
                                icon: Icons.download,
                                label: 'Download\nSeason ${instance.seasonNo}',
                              ),
                        ),
                      ],
                    ),
                    EpisodesRecommends(tvshowDetails: tvshowDetails),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBarWidget(),
      ),
    );
  }
}
