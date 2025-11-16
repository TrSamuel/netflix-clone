import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';
import 'package:netflixclone/features/netflix/presentation/provider/newhot_tab_provider.dart';
import 'package:provider/provider.dart';

class NewHotTabButton extends StatelessWidget {
  final String image;
  final String label;
  final int index;

  const NewHotTabButton({
    super.key,
    required this.image,
    required this.label,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final newHotTabchanger = context.watch<NewhotTabProvider>();
    final newIndex = newHotTabchanger.index;
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ElevatedButton.icon(
        onPressed: () {
          newHotTabchanger.changeIndex(index);
        },
        label: Text(
          label,
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        icon: Image.network(image, height: 25),
        style: ElevatedButton.styleFrom(
          backgroundColor: newIndex == index
              ? AppColors.whiteColor
              : AppColors.otherBgColor,
          foregroundColor: newIndex == index
              ? AppColors.otherBgColor
              : AppColors.whiteColor,
          shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColors.whiteColor, width: 1),
            borderRadius: BorderRadiusGeometry.circular(45),
          ),
        ),
      ),
    );
  }
}
