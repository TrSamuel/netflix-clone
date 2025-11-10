import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflixclone/features/netflix/core/api/api.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';
import 'package:netflixclone/features/netflix/core/utils/movie_category.dart';
import 'package:netflixclone/features/netflix/domain/entity/movie/movie.dart';
import 'package:netflixclone/features/netflix/presentation/service/movie_fetcher.dart';

class NewHotPage extends StatefulWidget {
  final double width;

  const NewHotPage({super.key, required this.width});

  @override
  State<NewHotPage> createState() => _NewHotPageState();
}

class _NewHotPageState extends State<NewHotPage>
    with AutomaticKeepAliveClientMixin {
  late final Future<List<Movie>> future;
  @override
  void initState() {
    super.initState();
    future = MovieFetcher.getMovies(MovieCategory.upcoming);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      padding: EdgeInsets.only(top: widget.width * 0.35),
      width: double.infinity,
      color: AppColors.otherBgColor,
      child: FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.hasError) {
            return Center(child: Text("No upcoming movies"));
          }
          final List<Movie> movies = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              children: List.generate(
                movies.length,
                (index) => movies[index].releaseDate_ != null
                    ? Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                child: Column(
                                  children: [
                                    Text(
                                      DateFormat(
                                        'MMM',
                                      ).format(movies[index].releaseDate_!),
                                      style: TextStyle(
                                        color: AppColors.whiteColor,
                                      ),
                                    ),
                                    Text(
                                      "${movies[index].releaseDate_!.day}",
                                      style: TextStyle(
                                        color: AppColors.whiteColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: [
                                    Image.network(
                                      '${Api.imageBaseUrl}/${movies[index].backdroppath_}',
                                      height: 150,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          movies[index].title_!,
                                          style: TextStyle(
                                            color: AppColors.whiteColor,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(height: 20),
                        ],
                      )
                    : SizedBox.shrink(),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class NewHotTabButton extends StatelessWidget {
  final String image;
  final String label;

  const NewHotTabButton({super.key, required this.image, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      label: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      icon: Image.network(image, height: 25),
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.otherBgColor,
        foregroundColor: AppColors.whiteColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColors.whiteColor, width: 1),
          borderRadius: BorderRadiusGeometry.circular(45),
        ),
      ),
    );
  }
}
