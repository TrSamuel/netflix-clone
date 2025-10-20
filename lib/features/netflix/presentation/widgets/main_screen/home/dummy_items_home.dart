import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/loading_item_container.dart';

class DummyItemsHome extends StatelessWidget {
  const DummyItemsHome({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            title,
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
              10,
              (index) => Row(
                children: [
                  SizedBox(width: 10),
                  SizedBox(
                    width: 100,
                    height: 150,
                    child: LoadingItemContainer(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
