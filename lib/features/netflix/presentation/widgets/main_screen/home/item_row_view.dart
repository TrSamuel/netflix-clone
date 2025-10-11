import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/api/api.dart';
import 'package:netflixclone/features/netflix/core/utils/tv_show_category.dart';
import 'package:netflixclone/features/netflix/domain/entity/movie/movie.dart';
import 'package:netflixclone/features/netflix/domain/entity/tv_show/tv_show.dart';
import 'package:netflixclone/features/netflix/presentation/service/movie_fetcher.dart';
import 'package:netflixclone/features/netflix/core/utils/movie_category.dart';
import 'package:netflixclone/features/netflix/presentation/service/tvshow_fetcher.dart';

class ItemRowView extends StatelessWidget {
  final String title;
  final MovieCategory? movieCategory;
  final TvShowCategory? tvShowCategory;
  const ItemRowView({
    super.key,
    required this.title,
    this.movieCategory,
    this.tvShowCategory,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FutureBuilder(
        future: movieCategory != null
            ? MovieFetcher.getMovies(movieCategory!)
            : TvshowFetcher.getTvShows(tvShowCategory!),
        builder: (context, snapshot) {
          if (!snapshot.hasData ||
              snapshot.hasError ||
              snapshot.data!.isEmpty) {
            return SizedBox.shrink();
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Row(
              children: List.generate(
                10,
                (index) => Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        title,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(10, (index) => Row(
                        children: [
                          SizedBox(width: 10),
                          Container(
                            width: 100,
                            height: 150,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  const Color.fromARGB(255, 40, 40, 40),
                                  const Color.fromARGB(255, 66, 66, 66),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),),
                      )
                    ),
                  ],
                ),
              ),
            );
          } else {
            final List rowItemList = snapshot.data!;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      rowItemList.length,
                      (index) => Row(
                        children: [
                          SizedBox(width: 10),
                          Container(
                            width: 100,
                            height: 150,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  '${Api.imageBaseUrl}/${movieCategory != null ? (rowItemList[index] as Movie).posterPath : (rowItemList[index] as TvShow).posterPath}}',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
