import 'package:flutter/material.dart';

class HeroCardGame extends StatelessWidget {
  const HeroCardGame({super.key, required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width * 0.85,
      height: 500,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(
            'https://image.tmdb.org/t/p/original/j6M2odS1RqGEUPKirIvB1VZ9i6Y.jpg',
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "Movie Title",
            style: TextStyle(
              color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: List.generate(
              4,
              (index) => Row(
                children: [
                  Text(
                    "Category${index + 1}",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(width: 5),

                  if (index != 3)
                    Container(
                      width: 3,
                      height: 3,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(500),
                      ),
                    ),
                  if (index != 3) SizedBox(width: 5),
                ],
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              HeroCardActionButton(
                icon: Icons.play_arrow,
                isDark: false,
                label: "Play",
              ),
              HeroCardActionButton(
                icon: Icons.add,
                isDark: true,
                label: "My List",
              ),
            ],
          ),
        ],
      ),
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
