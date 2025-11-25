import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';

class EmptyMessage extends StatelessWidget {
  const EmptyMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Oops. We haven't got that.",
              style: TextStyle(
                color: AppColors.whiteColor,
                fontSize: 22,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            Text(
              "Try searching for another movies, shows, actor, director or genre",
              style: TextStyle(
                fontSize: 18,
                color: const Color.fromARGB(
                  255,
                  122,
                  122,
                  122,
                ),
              ),
            ),
          ],
        ),
      );
  }
}
