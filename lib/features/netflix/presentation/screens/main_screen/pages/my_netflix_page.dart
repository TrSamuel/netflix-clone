import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/presentation/provider/download_provider.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/mynetflix/empty_d_view.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/mynetflix/movies_d_view.dart';
import 'package:provider/provider.dart';

class MyNetflixPage extends StatelessWidget {
  const MyNetflixPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DownloadProvider>(
      builder: (context, download, _) => download.movies.isNotEmpty
          ? MoviesDView(download: download)
          : EmptyDView(),
    );
  }
}
