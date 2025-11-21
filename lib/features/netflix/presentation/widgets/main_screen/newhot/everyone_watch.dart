import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflixclone/features/netflix/core/api/api.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';
import 'package:netflixclone/features/netflix/core/utils/cache_manager.dart';
import 'package:netflixclone/features/netflix/core/utils/tv_show_category.dart';
import 'package:netflixclone/features/netflix/domain/entity/tv_show/tv_show.dart';
import 'package:netflixclone/features/netflix/presentation/service/tvshow_fetcher.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/newhot/action_btn.dart';

class EveryoneWatch extends StatefulWidget {
  const EveryoneWatch({super.key});

  @override
  State<EveryoneWatch> createState() => _EveryoneWatchState();
}

class _EveryoneWatchState extends State<EveryoneWatch>
    with AutomaticKeepAliveClientMixin {
  late final Future<List<TvShow>> future;

  @override
  void initState() {
    future = TvshowFetcher.getTvShows(TvShowCategory.popular);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).width * 0.35),
      color: AppColors.otherBgColor,
      child: FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.hasError) {
            return Center(child: Text("No upcoming movies"));
          }
          final List<TvShow> tvShows = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              children: List.generate(tvShows.length, (index) {
                final TvShow tvShow = tvShows[index];
                return tvShow.backdropPath_ != null
                    ? TvShowItem(tvShow: tvShow)
                    : SizedBox.shrink();
              }),
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
  const TvShowItem({super.key, required this.tvShow});

  final TvShow tvShow;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(
              memCacheWidth: 600,
              width: MediaQuery.sizeOf(context).width * .95,
              imageUrl: '${Api.imageBaseUrl}/${tvShow.backdropPath_}',
              fit: BoxFit.cover,
              cacheManager: customCacheManager,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 170,
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
        Container(height: 20),
      ],
    );
  }
}
