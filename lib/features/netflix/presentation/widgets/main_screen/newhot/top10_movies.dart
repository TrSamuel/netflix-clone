import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflixclone/features/netflix/core/api/api.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';
import 'package:netflixclone/features/netflix/core/utils/movie_category.dart';
import 'package:netflixclone/features/netflix/domain/entity/movie/movie.dart';
import 'package:netflixclone/features/netflix/presentation/service/movie_fetcher.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/newhot/action_btn.dart';

class Top10Movies extends StatefulWidget {
  const Top10Movies({super.key});

  @override
  State<Top10Movies> createState() => _Top10MoviesState();
}

class _Top10MoviesState extends State<Top10Movies>
    with AutomaticKeepAliveClientMixin {
  late final Future<List<Movie>> future;

  @override
  void initState() {
    future = MovieFetcher.getMovies(MovieCategory.trendingDay);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).width * 0.37),
      width: double.infinity,
      color: AppColors.otherBgColor,
      child: FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.hasError) {
            return Center(child: Text("No top 10 movies"));
          }
          final List<Movie> movies = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              children: List.generate(
                movies.length < 10 ? movies.length : 10,
                (index) {
                  final Movie movie = movies[index];
                  return movie.backdroppath_ != null
                      ? MovieShowItem(movie: movie, position: index + 1)
                      : SizedBox.shrink();
                },
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

class MovieShowItem extends StatelessWidget {
  final int position;
  const MovieShowItem({super.key, required this.movie, required this.position});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox(
                width: MediaQuery.sizeOf(context).width * 0.10,
                child: Text(
                  "$position",
                  style: GoogleFonts.archivoBlack(
                    color: AppColors.whiteColor,
                    fontSize: 34,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    '${Api.imageBaseUrl}/${movie.backdroppath_}',
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 120,
                          child: Text(
                            movie.title_!,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                            style: GoogleFonts.lexend(
                              color: AppColors.whiteColor,
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            ActionBtn(icon: Icons.share, label: 'Share'),
                            ActionBtn(icon: Icons.add, label: 'My List'),
                            ActionBtn(icon: Icons.play_arrow, label: 'Play'),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        SizedBox(
                          width: MediaQuery.sizeOf(context).width * 0.7,
                          child: Text(
                            movie.overview_!,
                            style: GoogleFonts.notoSans(
                              color: AppColors.whiteColor,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(height: 20),
      ],
    );
  }
}
