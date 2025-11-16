import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';
import 'package:netflixclone/features/netflix/presentation/provider/bottomnav_provider.dart';
import 'package:netflixclone/features/netflix/presentation/screens/main_screen/pages/gamespage.dart';
import 'package:netflixclone/features/netflix/presentation/screens/main_screen/pages/home_page.dart';
import 'package:netflixclone/features/netflix/presentation/screens/main_screen/pages/my_netflix_page.dart';
import 'package:netflixclone/features/netflix/presentation/screens/main_screen/pages/new_hot_page.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/bottom_nav_bar_widget.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/build_page_widget.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/newhot/new_hot_tabbars.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/netflix_logo.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final pages = [
      HomePage(width: width),
      Gamespage(width: width),
      NewHotPage(width: width),
      MyNetflixPage(),
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 130),
        child: Consumer<BottomnavProvider>(
          builder: (context, bottomNavObj, _) => Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: AppColors.appbarColor,
                padding: EdgeInsets.only(top: width * 0.1),
                child: Row(
                  children: [
                    if (bottomNavObj.index == 0)
                      NetflixLogo()
                    else if (bottomNavObj.index == 1)
                      Text(
                        "Games",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    else if (bottomNavObj.index == 2)
                      Text(
                        "New & Hot",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    else
                      Text(
                        "Downloads",
                        style: TextStyle(
                          color: AppColors.whiteColor,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    Spacer(),
                    if (bottomNavObj.index == 0 || bottomNavObj.index == 2)
                      IconButton(onPressed: () {}, icon: Icon(Icons.download)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                  ],
                ),
              ),
              if (bottomNavObj.index == 2) NewHotTabbars(),
            ],
          ),
        ),
      ),

      body: BuildPageWidget(pages: pages),
      extendBodyBehindAppBar: true,
      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}
