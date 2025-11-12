import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflixclone/features/netflix/core/api/api.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';
import 'package:netflixclone/features/netflix/core/utils/tv_show_category.dart';
import 'package:netflixclone/features/netflix/domain/entity/tv_show/tv_show.dart';
import 'package:netflixclone/features/netflix/presentation/service/tvshow_fetcher.dart';

class NewHotPage extends StatefulWidget {
  final double width;

  const NewHotPage({super.key, required this.width});

  @override
  State<NewHotPage> createState() => _NewHotPageState();
}

class _NewHotPageState extends State<NewHotPage>
    with AutomaticKeepAliveClientMixin {
  late final Future<List<TvShow>> future;
  @override
  void initState() {
    super.initState();
    future = TvshowFetcher.getTvShows(TvShowCategory.comingSoon);
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FirstAirDate(tvShow: tvShow),
            AboutAndImg(tvShow: tvShow),
          ],
        ),
        Container(height: 20),
      ],
    );
  }
}

class AboutAndImg extends StatelessWidget {
  const AboutAndImg({super.key, required this.tvShow});

  final TvShow tvShow;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.8,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            '${Api.imageBaseUrl}/${tvShow.backdropPath_}',
            height: 180,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 80,
                  child: Text(
                    tvShow.name_!,
                    maxLines: 1,
                    style: TextStyle(color: AppColors.whiteColor),
                  ),
                ),
                Row(
                  children: [
                    ActionBtn(
                      icon: Icons.notifications_none,
                      label: 'Remind me',
                    ),

                    ActionBtn(icon: Icons.info, label: 'Info'),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ActionBtn extends StatelessWidget {
  final IconData icon;
  final String label;
  const ActionBtn({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: [
          Icon(icon, color: AppColors.whiteColor),
          Text(label, style: TextStyle(color: AppColors.whiteColor)),
        ],
      ),
    );
  }
}

class FirstAirDate extends StatelessWidget {
  const FirstAirDate({super.key, required this.tvShow});

  final TvShow tvShow;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width * 0.2,
      child: Column(
        children: [
          Text(
            DateFormat('MMM').format(tvShow.firstAirDate_!).toUpperCase(),
            style: TextStyle(color: AppColors.whiteColor),
          ),
          Text(
            "${tvShow.firstAirDate_!.day}",
            style: TextStyle(
              color: AppColors.whiteColor,
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
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
