import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/api/api.dart';
import 'package:netflixclone/features/netflix/core/utils/cache_manager.dart';
import 'package:netflixclone/features/netflix/domain/entity/api/movie/movie.dart';
import 'package:netflixclone/features/netflix/domain/entity/api/tv_show/tv_show.dart';
import 'package:netflixclone/features/netflix/presentation/provider/search_provider.dart';

class CompinedView extends StatelessWidget {
  final SearchProvider search;
  const CompinedView({super.key, required this.search});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisCount: 3,
      childAspectRatio: 1 / 1.5,
      children: List.generate(search.combined.length, (index) {
        var item = search.combined[index];
        String? posterPath;
        if (item is Movie) {
          posterPath = item.posterPath_;
        } else if (item is TvShow) {
          posterPath = item.posterPath_;
        } else {
          return SizedBox.shrink();
        }

        if (posterPath == null || posterPath.isEmpty) {
          return SizedBox.shrink();
        }

        return Padding(
          padding: const EdgeInsets.all(4.0),
          child: InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: CachedNetworkImageProvider(
                    cacheManager: customCacheManager,
                    '${Api.imageBaseUrl}/$posterPath',
                  ),
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
