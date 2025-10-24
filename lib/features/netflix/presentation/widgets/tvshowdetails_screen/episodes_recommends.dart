import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/api/api.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';
import 'package:netflixclone/features/netflix/core/utils/cache_manager.dart';
import 'package:netflixclone/features/netflix/domain/entity/tv_show/tv_show.dart';
import 'package:netflixclone/features/netflix/domain/entity/tv_show/tvshow_details.dart';
import 'package:netflixclone/features/netflix/presentation/provider/tabbar_view_provider.dart';
import 'package:netflixclone/features/netflix/presentation/provider/tvseason_selector.dart';
import 'package:netflixclone/features/netflix/presentation/screens/tvshowdetails_screen/tvshow_details_screen.dart';
import 'package:netflixclone/features/netflix/presentation/service/tvshow_fetcher.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/custom_nav.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/loading_item_container.dart';
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
    recommFuture = TvshowFetcher.getRecommTvShows(widget.tvshowDetails.id!);
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

class Episodes extends StatelessWidget {
  final TvshowDetails tvshowDetails;
  const Episodes({super.key, required this.tvshowDetails});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Consumer<TvseasonSelector>(
            builder: (context, season, child) => DropdownButton(
              menuMaxHeight: 100,
              style: TextStyle(color: AppColors.whiteColor),
              dropdownColor: AppColors.otherBgColor,
              value: season.seasonNo,
              items: [
                DropdownMenuItem(
                  value: 1,
                  child: Text("Season 1"),
                  onTap: () {
                    season.changeSeason(1);
                  },
                ),
                ...List.generate(
                  tvshowDetails.noOfSeasons! - 1,
                  (index) => DropdownMenuItem(
                    onTap: () {
                      season.changeSeason(index + 2);
                    },
                    value: index + 2,
                    child: Text("Season ${index + 2}"),
                  ),
                ),
              ],
              onChanged: (value) {},
            ),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.info)),
        ],
      ),
    );
  }
}

class RecommTvShows extends StatelessWidget {
  const RecommTvShows({
    super.key,
    required this.recommFuture,
    required this.size,
  });

  final Future<List<TvShow>> recommFuture;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: recommFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return GridView.count(
            crossAxisCount: 3,
            physics: NeverScrollableScrollPhysics(),
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
            childAspectRatio: 1 / 1.5,
            children: List.generate(12, (index) => LoadingItemContainer()),
          );
        }

        if (!snapshot.hasData ||
            snapshot.hasError ||
            snapshot.data == null ||
            snapshot.data!.isEmpty) {
          return SizedBox.shrink();
        }

        final List<TvShow> tvShows = snapshot.data!;
        return Wrap(
          runSpacing: 8,
          spacing: 8,
          children: List.generate(
            12,
            (index) => tvShows[index].posterPath != null
                ? GestureDetector(
                    onTap: () async {
                      final TvshowDetails? tvshowDetails =
                          await TvshowFetcher.getTvShowDetails(
                            (tvShows[index].id!),
                          );
                      if (tvshowDetails != null) {
                        Navigator.push(
                          context,
                          CustomNav(
                            page: TvshowDetailsScreen(
                              tvshowDetails: tvshowDetails,
                            ),
                          ),
                        );
                      }
                    },
                    child: CachedNetworkImage(
                      cacheManager: customCacheManager,
                      memCacheHeight: 200,
                      fit: BoxFit.cover,
                      width: size.width * 0.3,
                      height: 200,
                      imageUrl:
                          '${Api.imageBaseUrl}/${tvShows[index].posterPath}',
                    ),
                  )
                : SizedBox.shrink(),
          ),
        );
      },
    );
  }
}
