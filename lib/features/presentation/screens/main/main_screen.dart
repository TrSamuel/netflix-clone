import 'package:flutter/material.dart';
import 'package:netflixclone/features/presentation/widgets/item_row_view.dart';
import 'package:netflixclone/features/presentation/widgets/main_screen/hero_card.dart';
import 'package:netflixclone/features/presentation/widgets/netflix_logo.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 130),
        child: Padding(
          padding: const EdgeInsets.only(left: 18, right: 18, top: 48),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  NetflixLogo(),
                  Spacer(),
                  IconButton(onPressed: () {}, icon: Icon(Icons.download)),
                  IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ...List.generate(
                    2,
                    (index) => Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: OutlinedButton(
                        onPressed: () {},
                        child: Text("Shows"),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: OutlinedButton.icon(
                      iconAlignment: IconAlignment.end,
                      icon: Icon(Icons.keyboard_arrow_down),
                      onPressed: () {},
                      label: Text("Categories"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.only(top: width * 0.4),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: AlignmentGeometry.bottomCenter,
              end: Alignment.topCenter,
              colors: [Colors.black, Colors.blueGrey],
            ),
          ),
          child: Column(
            children: [
              HeroCard(width: width),
              ItemRowView(),
              ItemRowViewTop10(),
              ItemRowView(),
            ],
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
    );
  }
}

class ItemRowViewTop10 extends StatelessWidget {
  const ItemRowViewTop10({super.key});

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
              "Top 10",
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
                    Stack(
                      alignment: Alignment.bottomLeft,
                      children: [
                        Text(
                          "${index + 1}",
                          
                          style: TextStyle(color: Colors.white, fontSize: 54,),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 35),
                          child: Container(
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
                        ),
                      ],
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
