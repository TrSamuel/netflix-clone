import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';

class NewHotTabButton extends StatelessWidget {
  final String image;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const NewHotTabButton({
    super.key,
    required this.image,
    required this.label,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      label: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      icon: Image.network(image, height: 25),
      style: ElevatedButton.styleFrom(
        backgroundColor: isSelected
            ? AppColors.whiteColor
            : AppColors.otherBgColor,
        foregroundColor: isSelected
            ? AppColors.otherBgColor
            : AppColors.whiteColor,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: AppColors.whiteColor, width: 1),
          borderRadius: BorderRadiusGeometry.circular(45),
        ),
      ),
    );
  }
}
