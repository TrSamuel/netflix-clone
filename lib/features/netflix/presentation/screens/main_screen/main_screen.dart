import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';
import 'package:netflixclone/features/netflix/presentation/provider/bottomnav_provider.dart';
import 'package:netflixclone/features/netflix/presentation/screens/main_screen/pages/gamespage.dart';
import 'package:netflixclone/features/netflix/presentation/screens/main_screen/pages/home_page.dart';
import 'package:netflixclone/features/netflix/presentation/screens/main_screen/pages/my_netflix_page.dart';
import 'package:netflixclone/features/netflix/presentation/screens/main_screen/pages/new_hot_page.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/bottom_nav_bar_widget.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/build_page_widget.dart';
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
                    if (bottomNavObj.index == 0)
                      IconButton(onPressed: () {}, icon: Icon(Icons.download)),
                    IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                  ],
                ),
              ),
              if (bottomNavObj.index == 2)
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      NewHotTabButton(
                        label: "Coming Soon",
                        image:
                            'https://www.nicepng.com/png/detail/16-169469_popcorn-vector-transparent-popcorn-clipart.png',
                      ),
                      NewHotTabButton(
                        label: "Everyone's Watching",
                        image:
                            'https://static.vecteezy.com/system/resources/previews/046/340/349/non_2x/fire-flame-clipart-design-illustration-free-png.png',
                      ),
                      NewHotTabButton(
                        label: "Games",
                        image:
                            'https://imgs.search.brave.com/sZ3wndY9cnS0ks-Btl9-9iJs3uRS76XRZ4jx8_XZfsM/rs:fit:860:0:0:0/g:ce/aHR0cHM6Ly93d3cu/dmh2LnJzL2Rwbmcv/ZC80ODEtNDgxNDg1/M19nYW1lcy1pY29u/LXBuZy1waW5rLXRy/YW5zcGFyZW50LXBu/Zy5wbmc',
                      ),
                      NewHotTabButton(
                        label: "Top 10 Shows",
                        image:
                            'https://media.gettyimages.com/id/2226484170/vector/top-10-best-of-list.jpg?s=2048x2048&w=gi&k=20&c=eJLYwALjyJYPwUfoSZ6HWlXqftrBtlEAEX5gDy549bw=',
                      ),
                      NewHotTabButton(
                        label: "Top 10 Movies",
                        image:
                            'https://media.gettyimages.com/id/2226484170/vector/top-10-best-of-list.jpg?s=2048x2048&w=gi&k=20&c=eJLYwALjyJYPwUfoSZ6HWlXqftrBtlEAEX5gDy549bw=',
                      ),
                    ],
                  ),
                ),
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
