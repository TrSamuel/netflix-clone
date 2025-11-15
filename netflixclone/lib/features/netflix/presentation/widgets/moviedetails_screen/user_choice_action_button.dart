import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';

class UserChoiceActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  const UserChoiceActionButton({
    super.key,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 20, left: 25, top: 25),
      child: GestureDetector(
        onTap: () {},
        child: Row(
          children: [
            Column(
              children: [
                Icon(icon, color: AppColors.whiteColor),
                Text(label, style: TextStyle(color: AppColors.whiteColor)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
