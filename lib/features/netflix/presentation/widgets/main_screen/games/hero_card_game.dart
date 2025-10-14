import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';

class HeroCardGame extends StatelessWidget {
  const HeroCardGame({super.key, required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    final kWidth = width * 0.95;
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Container(
          width: kWidth,
          height: 500,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentGeometry.bottomLeft,
              end: AlignmentGeometry.topRight,
              stops: [0, 0.3],
              colors: [
                const Color.fromARGB(255, 91, 19, 15),
                const Color.fromARGB(255, 24, 5, 41),
              ],
            ),
          ),
        ),
        Container(
          width: kWidth,
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/image/gamecarosal.png'),
            ),
          ),
        ),
        SizedBox(
          width: kWidth,
          height: 500,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/logo/netflixlogo.png', height: 35),
                  SizedBox(width: 10),
                  Text(
                    "GAMES",
                    style: TextStyle(
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 3,
                    ),
                  ),
                ],
              ),
              Text(
                "Unlimited access to\nexclussive games",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                "No ads. No extra fees. No in-app\npurchases. Included with your\nmembership",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColors.whiteColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}

class HeroCardActionButton extends StatelessWidget {
  final bool isDark;
  final IconData icon;
  final String label;
  const HeroCardActionButton({
    super.key,
    required this.isDark,
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          minimumSize: Size(0, 35),
          padding: EdgeInsets.symmetric(horizontal: 45),
          backgroundColor: isDark
              ? const Color.fromARGB(255, 57, 57, 57)
              : Colors.white,
          foregroundColor: isDark ? Colors.white : Colors.black,
          shape: LinearBorder(),
        ),
        onPressed: () {},
        label: Text(label),
        icon: Icon(icon),
      ),
    );
  }
}
