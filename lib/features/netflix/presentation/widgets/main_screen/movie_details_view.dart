import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';
import 'package:netflixclone/features/netflix/presentation/provider/itemPrevieProvider.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/main_action_button.dart';
import 'package:provider/provider.dart';

class MovieDetailsView extends StatelessWidget {
  final int movieId;
  const MovieDetailsView({super.key, required this.movieId});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Consumer<Itemprevieprovider>(
      builder: (context,prevInstance,_) =>  Visibility(
        visible: prevInstance.movieDetailsPreview,
        child: Container(
          width: double.infinity,
          height: double.infinity,
          color: AppColors.otherBgColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 85,
                color: AppColors.otherBgColor,
              ),
              Container(
                width: double.infinity,
                height: 200,
                decoration: BoxDecoration(color: AppColors.whiteColor),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Movie Title",
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
                            "2025",
                            style: TextStyle(color: AppColors.whiteColor),
                          ),
                          Text(
                            "U/A 16+",
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
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
