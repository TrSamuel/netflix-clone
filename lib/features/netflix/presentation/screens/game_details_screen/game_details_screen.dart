import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';
import 'package:netflixclone/features/netflix/core/utils/cache_manager.dart';
import 'package:netflixclone/features/netflix/domain/entity/api/game/game_details.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/bottom_nav_bar_widget.dart';

class GameDetailsScreen extends StatelessWidget {
  final GameDetails gameDetails;
  const GameDetailsScreen({super.key, required this.gameDetails});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Games"),
          titleTextStyle: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          backgroundColor: const Color.fromARGB(150, 0, 0, 0),
        ),
        backgroundColor: AppColors.otherBgColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  CachedNetworkImage(
                    cacheManager: customCacheManager,
                    width: double.infinity,
                    height: 500,
                    fit: BoxFit.fill,
                    imageUrl: gameDetails.screenshots.first,
                    placeholder: (context, url) => Container(
                      color: AppColors.otherBgColor,
                      child: Center(
                        child: Text(
                          gameDetails.title,
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
                          gameDetails.title,
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
                  Container(
                    width: double.infinity,
                    height: 500,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          const Color.fromARGB(69, 0, 0, 0),
                          Colors.black,
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CachedNetworkImage(
                        imageUrl: gameDetails.thumbnail,
                        width: 100,
                        height: 100,
                        fit: BoxFit.cover,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 18),
                        child: Text(
                          gameDetails.title,
                          style: TextStyle(
                            color: AppColors.whiteColor,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        shape: LinearBorder(),
                        backgroundColor: AppColors.whiteColor,
                        foregroundColor: Colors.black,
                        fixedSize: Size.fromWidth(width),
                      ),
                      onPressed: () {},
                      label: Text(
                        'Get Game',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        ActionButton(label: 'My List', icon: Icons.add),
                        ActionButton(label: 'Rate', icon: Icons.thumb_up),
                        ActionButton(icon: Icons.share),
                      ],
                    ),
                    Text(
                      gameDetails.descr,
                      style: TextStyle(
                        fontSize: 16,
                        color: AppColors.whiteColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "Genre: ${gameDetails.genre}",
                      style: TextStyle(color: AppColors.greyColor),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavBarWidget(),
        extendBodyBehindAppBar: true,
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  final IconData icon;
  final String? label;
  const ActionButton({super.key, required this.icon, this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 3),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromARGB(255, 36, 36, 36),
          foregroundColor: AppColors.whiteColor,
          shape: LinearBorder(),
        ),
        onPressed: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: const EdgeInsets.all(8.0), child: Icon(icon)),
            if (label != null)
              Padding(padding: const EdgeInsets.all(8.0), child: Text(label!)),
          ],
        ),
      ),
    );
  }
}
