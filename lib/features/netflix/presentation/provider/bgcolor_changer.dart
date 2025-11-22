import 'package:dominant_color_detector/dominant_color_detector.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';

class BgcolorChanger extends ChangeNotifier {
  Color bgcolor = AppColors.homeBgColor;

  Future<Color> setColor(String url) async {
    final imgBytes = await fetchImageBytes(url);
    List<DominantColorStat> result = await DominantColorDetector.analyze(
      imgBytes,
    );
    result = result.where((domColor) {
      return domColor.color.color.computeLuminance() > 0.3;
    }).toList();

    result.sort(
      (a, b) => a.color.color.computeLuminance().compareTo(
        b.color.color.computeLuminance(),
      ),
    );
    return result.first.color.color;
  }

  defaultColor() async {
    bgcolor = await setColor(
      'https://image.tmdb.org/t/p/original/j6M2odS1RqGEUPKirIvB1VZ9i6Y.jpg',
    );
    notifyListeners();
  }

  changeColor(String url) async {
    bgcolor = await setColor(url);
    notifyListeners();
  }
}
