import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';

class AppTheme {
  static ThemeData themeData = ThemeData(
    scaffoldBackgroundColor: AppColors.otherBgColor,
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: AppColors.bottomNavBgColor,
      selectedItemColor: AppColors.whiteColor,
      unselectedItemColor: AppColors.greyColor,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        minimumSize: Size(0, 36),
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        foregroundColor: Colors.white,
        side: BorderSide(width: 1, color: Colors.white),
      ),
    ),
    iconButtonTheme: IconButtonThemeData(
      style: IconButton.styleFrom(foregroundColor: Colors.white),
    ),
  );
}
