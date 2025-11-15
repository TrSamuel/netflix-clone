import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';
import 'package:netflixclone/features/netflix/domain/entity/tv_show/tv_show.dart';
import 'package:netflixclone/features/netflix/domain/entity/tv_show/tvshow_details.dart';
import 'package:netflixclone/features/netflix/presentation/provider/tabbar_view_provider.dart';
import 'package:netflixclone/features/netflix/presentation/service/tvshow_fetcher.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/tvshowdetails_screen/episodes.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/tvshowdetails_screen/recomm_tv_shows.dart';
import 'package:provider/provider.dart';

class EpisodesRecommends extends StatefulWidget {
  final TvshowDetails tvshowDetails;

  const EpisodesRecommends({super.key, required this.tvshowDetails});

  @override
  State<EpisodesRecommends> createState() => _EpisodesRecommendsState();
}

class _EpisodesRecommendsState extends State<EpisodesRecommends>
    with AutomaticKeepAliveClientMixin {
  late Future<List<TvShow>> recommFuture;
  @override
  void initState() {
    super.initState();
    recommFuture = TvshowFetcher.getRecommTvShows(widget.tvshowDetails.id_!);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.only(top: 35),
      child: Consumer<TabbarViewProvider>(
        builder: (context, tabIndexOb, _) => Column(
          children: [
            Stack(
              alignment: Alignment.topLeft,
              children: [
                Divider(),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.whiteColor,
                          shape: tabIndexOb.index == 0
                              ? LinearBorder.top(
                                  side: BorderSide(
                                    width: 3,
                                    color: AppColors.redColor,
                                  ),
                                )
                              : null,
                        ),
                        onPressed: () {
                          tabIndexOb.changeIndex(0);
                        },
                        child: Text("Episodes"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 3),
                      child: TextButton(
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.whiteColor,
                          shape: tabIndexOb.index == 1
                              ? LinearBorder.top(
                                  side: BorderSide(
                                    width: 3,
                                    color: AppColors.redColor,
                                  ),
                                )
                              : null,
                        ),
                        onPressed: () {
                          tabIndexOb.changeIndex(1);
                        },
                        child: Text("More Like This"),
                      ),
                    ),
                  ],
                ),
              ],
            ),

            tabIndexOb.index == 0
                ? Episodes(tvshowDetails: widget.tvshowDetails)
                : RecommTvShows(recommFuture: recommFuture, size: size),
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
