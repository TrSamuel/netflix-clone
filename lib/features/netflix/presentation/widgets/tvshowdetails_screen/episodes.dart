import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/api/api.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';
import 'package:netflixclone/features/netflix/core/utils/cache_manager.dart';
import 'package:netflixclone/features/netflix/domain/entity/tv_show/episode.dart';
import 'package:netflixclone/features/netflix/domain/entity/tv_show/tvshow_details.dart';
import 'package:netflixclone/features/netflix/presentation/provider/tvseason_selector.dart';
import 'package:netflixclone/features/netflix/presentation/service/tvshow_fetcher.dart';
import 'package:provider/provider.dart';

class Episodes extends StatelessWidget {
  final TvshowDetails tvshowDetails;
  const Episodes({super.key, required this.tvshowDetails});

  @override
  Widget build(BuildContext context) {
    return Consumer<TvseasonSelector>(
      builder: (context, season, child) => Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton.icon(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => Container(
                      width: double.infinity,
                      height: double.infinity,
                      color: const Color.fromARGB(193, 0, 0, 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          SizedBox(
                            width: MediaQuery.sizeOf(context).width * 8,
                            height: MediaQuery.sizeOf(context).height * 0.4,
                            child: ListView.builder(
                              itemCount: tvshowDetails.noOfSeasons_,
                              itemBuilder: (context, index) => Center(
                                child: GestureDetector(
                                  onTap: () {
                                    season.changeSeason(index + 1);
                                    Navigator.pop(context);
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 18),
                                    child: Text(
                                      "Season ${index + 1}",
                                      style: TextStyle(
                                        color: AppColors.whiteColor,
                                        fontSize: season.seasonNo == index + 1
                                            ? 24
                                            : 20,
                                        fontWeight: season.seasonNo == index + 1
                                            ? FontWeight.bold
                                            : FontWeight.normal,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.sizeOf(context).height * 0.2,
                            alignment: AlignmentDirectional.bottomCenter,
                            padding: EdgeInsets.only(bottom: 18),
                            child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: CircleAvatar(
                                radius: 30,
                                backgroundColor: AppColors.whiteColor,
                                child: Icon(Icons.close),
                              ),
                              color: AppColors.otherBgColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                label: Text("Season ${season.seasonNo}"),
                icon: Icon(Icons.arrow_drop_down),
                iconAlignment: IconAlignment.end,
                style: TextButton.styleFrom(
                  foregroundColor: AppColors.whiteColor,
                ),
              ),

              IconButton(onPressed: () {}, icon: Icon(Icons.info)),
            ],
          ),
          FutureBuilder(
            future: TvshowFetcher.getEpisodes(
              tvshowDetails.id_!,
              season.seasonNo,
            ),
            builder: (context, snapshot) {
              if (!snapshot.hasData || snapshot.hasError) {
                return SizedBox.shrink();
              }
              final List<Episode> episodes = snapshot.data!;
              return ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: episodes.length,
                itemBuilder: (context, index) => ListTile(
                  leading: CachedNetworkImage(
                    cacheManager: customCacheManager,
                    width: 100,
                    height: 50,
                    memCacheHeight: 50,
                    memCacheWidth: 100,
                    imageUrl:
                        '${Api.imageBaseUrl}/${episodes[index].stillPath_}',
                    placeholder: (context, url) => Container(),
                    errorWidget: (context, url, error) => Container(),
                    fit: BoxFit.cover,
                  ),
                  title: Text(episodes[index].name_!),
                  subtitle: Text(
                    episodes[index].overview_!,

                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
