import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/presentation/screens/main/pages/gamespage.dart';
import 'package:netflixclone/features/netflix/presentation/screens/main/pages/home_page.dart';
import 'package:netflixclone/features/netflix/presentation/screens/main/pages/my_netflix_page.dart';
import 'package:netflixclone/features/netflix/presentation/screens/main/pages/new_hot_page.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/bottom_nav_bar_widget.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/build_page_widget.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/netflix_logo.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    final pages = [
      HomePage(width: width),
      Gamespage(width: width,),
      NewHotPage(),
      MyNetflixPage(),
    ];
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 130),
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, top: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  NetflixLogo(),
                  Spacer(),
                  IconButton(onPressed: () {}, icon: Icon(Icons.download)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ...List.generate(
                    2,
                    (index) => Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text("Shows"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: OutlinedButton.icon(
                      iconAlignment: IconAlignment.end,
                      icon: Icon(Icons.keyboard_arrow_down),
                      onPressed: () {},
                      label: Text("Categories"),
                    ),
                  ),
                ],
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
