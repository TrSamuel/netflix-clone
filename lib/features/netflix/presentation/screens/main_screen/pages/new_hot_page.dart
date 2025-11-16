import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/presentation/provider/newhot_tab_provider.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/newhot/everyone_watch.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/newhot/games.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/newhot/coming_soon.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/newhot/top10_movies.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/newhot/top10_tv_shows.dart';
import 'package:provider/provider.dart';

class NewHotPage extends StatelessWidget {
  final double width;

  const NewHotPage({super.key, required this.width});

  @override
  Widget build(BuildContext context) {
    return Selector<NewhotTabProvider, int>(
      selector: (context, instance) => instance.index,
      builder: (context, index, child) => IndexedStack(
        index: index,
        children: [
          CommingSoon(),
          EveryoneWatch(),
          Games(),
          Top10TvShows(),
          Top10Movies(),
        ],
      ),
    );
  }
}
