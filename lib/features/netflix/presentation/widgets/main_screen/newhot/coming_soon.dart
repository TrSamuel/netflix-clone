import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';
import 'package:netflixclone/features/netflix/core/utils/tv_show_category.dart';
import 'package:netflixclone/features/netflix/domain/entity/tv_show/tv_show.dart';
import 'package:netflixclone/features/netflix/presentation/service/tvshow_fetcher.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/newhot/tv_show_item.dart';

class CommingSoon extends StatefulWidget {
  const CommingSoon({
    super.key,
  });


  @override
  State<CommingSoon> createState() => _CommingSoonState();
}



class _CommingSoonState extends State<CommingSoon> with AutomaticKeepAliveClientMixin{

    late final Future<List<TvShow>> future;


    @override
  void initState() {
    future = TvshowFetcher.getTvShows(TvShowCategory.comingSoon);
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).width * 0.35),
      width: double.infinity,
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