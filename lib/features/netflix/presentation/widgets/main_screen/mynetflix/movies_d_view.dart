import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/api/api.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';
import 'package:netflixclone/features/netflix/presentation/provider/bottomnav_provider.dart';
import 'package:netflixclone/features/netflix/presentation/provider/download_provider.dart';
import 'package:provider/provider.dart';

class MoviesDView extends StatelessWidget {
  final DownloadProvider download;
  const MoviesDView({super.key, required this.download});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ...List.generate(download.movies.length, (index) {
          final movie = download.movies[index];
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: Row(
              children: [
                Container(
                  width: 150,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                        '${Api.imageBaseUrl}/${movie.backdropPath}',
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 5),
                SizedBox(
                  width: 120,
                  child: Text(
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    movie.title,
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Spacer(),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: const Color.fromARGB(255, 58, 58, 58),
                        title: Text(
                          "Remove from downloads?",
                          style: TextStyle(color: Colors.white),
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Cancel",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          TextButton(
                            onPressed: () async {
                              await download.delMovie(movie.id);
                              Navigator.pop(context);
                            },
                            child: Text(
                              "Remove",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: Icon(Icons.download_done, color: AppColors.whiteColor),
                ),
              ],
            ),
          );
        }),
        SizedBox(height: 100),
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: LinearBorder(),
              backgroundColor: const Color.fromARGB(255, 29, 29, 29),
              foregroundColor: AppColors.whiteColor,
            ),
            onPressed: () {
              context.read<BottomnavProvider>().changeIndex(0);
              Navigator.pop(context);
            },
            child: Text(
              "Find More to Download",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 17),
            ),
          ),
        ),
      ],
    );
  }
}
