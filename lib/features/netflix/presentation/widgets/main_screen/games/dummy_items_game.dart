import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';
import 'package:netflixclone/features/netflix/presentation/provider/bottomnav_provider.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/loading_item_container.dart';
import 'package:provider/provider.dart';

class DummyItemsGame extends StatelessWidget {
  final bool isSeeAll;
  const DummyItemsGame({super.key, required this.title, this.isSeeAll = false});

  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton.icon(
                onPressed: () {
                  Provider.of<BottomnavProvider>(
                    context,
                    listen: false,
                  ).changeIndex(1);
                },
                label: Text("See All"),
                icon: Icon(Icons.arrow_forward_ios),
                style: TextButton.styleFrom(
                  iconAlignment: IconAlignment.end,
                  textStyle: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  foregroundColor: AppColors.whiteColor,
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                10,
                (index) => Row(
                  children: [
                    SizedBox(width: 10),
                    SizedBox(
                      width: 100,
                      height: 100,
                      child: LoadingItemContainer(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
