import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';
import 'package:netflixclone/features/netflix/presentation/screens/search_screen/seach_screen.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/bottom_nav_bar_widget.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/download_screen/download_logo.dart';

class DowloadScreen extends StatelessWidget {
  const DowloadScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Downloads"),
        foregroundColor: AppColors.whiteColor,
        backgroundColor: AppColors.otherBgColor,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SeachScreen()),
              );
            },
            icon: Icon(Icons.search),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.menu)),
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            DownloadLogo(),
            SizedBox(height: 45),
            Text(
              "Movies and TV shows that\nyou download appear here.",
              style: TextStyle(
                color: const Color.fromARGB(255, 146, 146, 146),
                fontSize: 21,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 85),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: LinearBorder(),
                foregroundColor: Colors.black,
              ),
              onPressed: () {},
              child: Text(
                "Find Something to Download",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavBarWidget(),
    );
  }
}
