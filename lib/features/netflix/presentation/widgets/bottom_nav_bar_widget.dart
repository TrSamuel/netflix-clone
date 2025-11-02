import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/presentation/provider/bottomnav_provider.dart';
import 'package:netflixclone/features/netflix/presentation/screens/main_screen/main_screen.dart';
import 'package:provider/provider.dart';

class BottomNavBarWidget extends StatelessWidget {
  const BottomNavBarWidget({super.key,});

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomnavProvider>(
      builder: (_, instance, _) => BottomNavigationBar(
        currentIndex: instance.index,
        onTap: (index) {
          instance.changeIndex(index);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MainScreen()),
            );
          
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.game_controller),
              label: 'Games',
            ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.flame),
            label: 'New & Hot',
          ),
          BottomNavigationBarItem(
            icon: Image.asset('assets/icon/mynetflixicon.jpg', height: 25),
            label: 'My Netflix',
          ),
        ],
      ),
    );
  }
}
