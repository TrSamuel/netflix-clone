import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/api/api.dart';
import 'package:netflixclone/features/netflix/core/utils/cache_manager.dart';
import 'package:netflixclone/features/netflix/domain/entity/api/tv_show/tv_show.dart';
import 'package:netflixclone/features/netflix/domain/entity/api/tv_show/tvshow_details.dart';
import 'package:netflixclone/features/netflix/presentation/provider/tabbar_view_provider.dart';
import 'package:netflixclone/features/netflix/presentation/provider/tvseason_selector.dart';
import 'package:netflixclone/features/netflix/presentation/screens/tvshowdetails_screen/tvshow_details_screen.dart';
import 'package:netflixclone/features/netflix/presentation/service/tvshow_fetcher.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/custom_nav.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/loading_item_container.dart';
import 'package:provider/provider.dart';

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
            shrinkWrap: true,
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
            (index) => tvShows[index].posterPath_ != null
                ? GestureDetector(
                    onTap: () async {
                      final TvshowDetails? tvshowDetails =
                          await TvshowFetcher.getTvShowDetails(
                            (tvShows[index].id_!),
                          );
                      if (tvshowDetails != null) {
                        Provider.of<TabbarViewProvider>(
                          context,
                          listen: false,
                        ).changeIndex(0);
                        Provider.of<TvseasonSelector>(
                          context,
                          listen: false,
                        ).changeSeason(1);
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
                          '${Api.imageBaseUrl}/${tvShows[index].posterPath_}',
                    ),
                  )
                : SizedBox.shrink(),
          ),
        );
      },
    );
  }
}
