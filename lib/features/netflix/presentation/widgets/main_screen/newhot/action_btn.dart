import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';

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
