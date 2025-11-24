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

    result = result.where((dom) {
      return dom.color.color.computeLuminance() < 0.65;
    }).toList();

    result = result.where((dom) {
      final hsl = HSLColor.fromColor(dom.color.color);
      return !(hsl.hue >= 10 && hsl.hue <= 50);
    }).toList();

    if (result.isEmpty) {
      return AppColors.homeBgColor;
    }

    Color pick = result.first.color.color;

    HSLColor hsl = HSLColor.fromColor(pick);
    if (hsl.lightness > 0.4) {
      hsl = hsl.withLightness(0.25);
    }

    return hsl.toColor();
  }

  changeColor(String url) async {
    bgcolor = await setColor(url);
    notifyListeners();
  }
}
