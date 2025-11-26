import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflixclone/features/netflix/core/api/api.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';
import 'package:netflixclone/features/netflix/core/utils/tv_show_category.dart';
import 'package:netflixclone/features/netflix/domain/entity/api/tv_show/tv_show.dart';
import 'package:netflixclone/features/netflix/presentation/service/tvshow_fetcher.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/newhot/action_btn.dart';

class Top10TvShows extends StatefulWidget {
  const Top10TvShows({super.key});

  @override
  State<Top10TvShows> createState() => _Top10TvShowsState();
}

class _Top10TvShowsState extends State<Top10TvShows>
    with AutomaticKeepAliveClientMixin {
  late final Future<List<TvShow>> future;

  @override
  void initState() {
    future = TvshowFetcher.getTvShows(TvShowCategory.trendingDay);
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
            return Center(child: Text("No top 10 tvshows"));
          }
          final List<TvShow> tvShows = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              children: List.generate(
                tvShows.length < 10 ? tvShows.length : 10,
                (index) {
                  final TvShow tvShow = tvShows[index];
                  return tvShow.backdropPath_ != null
                      ? TvShowItem(tvShow: tvShow, position: index + 1)
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

class TvShowItem extends StatelessWidget {
  final int position;
  const TvShowItem({super.key, required this.tvShow, required this.position});

  final TvShow tvShow;

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
                    fontSize: 26,
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
                    '${Api.imageBaseUrl}/${tvShow.backdropPath_}',
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
                            tvShow.name_!,
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
                            tvShow.overview_!,
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
