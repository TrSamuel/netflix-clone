import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/presentation/provider/newhot_tabs_changer.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/new_hot/coming_soon.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/new_hot/everyone_wtch.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/new_hot/games.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/new_hot/top10_m_ovies.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/new_hot/top10_shows.dart';
import 'package:provider/provider.dart';

class NewHotPage extends StatelessWidget {
  final double width;

  const NewHotPage({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Selector<NewhotTabsChanger, int>(
      selector: (context, instance) => instance.index,
      builder: (context, index, child) => IndexedStack(
        index: index,
        children: [
          ComingSoon(),
          EveryoneWtch(),
          Games(),
          Top10Shows(),
          Top10MOvies(),
        ],
      ),
    );
  }
}
