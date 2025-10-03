import 'package:flutter/material.dart';

class ItemRowView extends StatelessWidget {
  const ItemRowView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              "Title",
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                20,
                (index) => Row(
                  children: [
                    SizedBox(width: 10),
                    Container(
                      width: 100,
                      height: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://image.tmdb.org/t/p/w1280/39yiXowRsRe8acSggARllxXJXgy.jpg',
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
