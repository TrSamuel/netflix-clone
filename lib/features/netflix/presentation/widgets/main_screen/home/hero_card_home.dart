import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/api/api.dart';
import 'package:netflixclone/features/netflix/core/utils/cache_manager.dart';
import 'package:netflixclone/features/netflix/core/utils/movie_category.dart';
import 'package:netflixclone/features/netflix/domain/entity/api/movie/movie.dart';
import 'package:netflixclone/features/netflix/domain/entity/api/movie/movie_details.dart';
import 'package:netflixclone/features/netflix/presentation/provider/bgcolor_changer.dart';
import 'package:netflixclone/features/netflix/presentation/screens/moviedetails_screen/movie_details_screen.dart';
import 'package:netflixclone/features/netflix/presentation/service/movie_fetcher.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/custom_nav.dart';
import 'package:provider/provider.dart';

class HeroCardHome extends StatefulWidget {
  const HeroCardHome({super.key, required this.width});

  final double width;

  @override
  State<HeroCardHome> createState() => _HeroCardHomeState();
}

class _HeroCardHomeState extends State<HeroCardHome> {
  late final Future future;
  @override
  void initState() {
    future = MovieFetcher.getMovies(MovieCategory.trendingDay);
    super.initState();
  }

  getBgColor(String url) async {
    context.read<BgcolorChanger>().changeColor(url);
  }

  bool isColorSelected = false;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: future,
      builder: (context, snapshot) {
        if (!snapshot.hasData || snapshot.hasError || snapshot.data!.isEmpty) {
          return DefaultItem(width: widget.width);
        }
        final Movie movie = snapshot.data!.first;
        if (!isColorSelected) {
          Future.microtask(() {
            getBgColor('${Api.imageBaseUrl}/${movie.posterPath_!}');
            isColorSelected = true;
          });
        }

        return GestureDetector(
          onTap: () async {
            final MovieDetails? movieDetails =
                await MovieFetcher.getMovieDetails(movie.id_!);
            if (movieDetails != null) {
              Navigator.push(
                context,
                CustomNav(page: MovieDetailsScreen(movieDetails: movieDetails)),
              );
            }
          },
          child: Stack(
            children: [
              Container(
                width: widget.width * 0.85,
                height: 500,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: CachedNetworkImageProvider(
                      cacheManager: customCacheManager,
                      '${Api.imageBaseUrl}/${movie.posterPath_!}',
                    ),
                  ),
                ),
              ),
              Consumer<BgcolorChanger>(
                builder: (context, bg, child) =>  Container(
                  width: widget.width * 0.85,
                  height: 500,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      stops: [0.4, 1],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, bg.bgcolor],
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
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
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class DefaultItem extends StatelessWidget {
  const DefaultItem({super.key, required this.width});

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
          image: CachedNetworkImageProvider(
            cacheManager: customCacheManager,
            'https://image.tmdb.org/t/p/original/j6M2odS1RqGEUPKirIvB1VZ9i6Y.jpg',
          ),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
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
