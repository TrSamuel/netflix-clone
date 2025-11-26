import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';
import 'package:netflixclone/features/netflix/domain/entity/api/movie/movie_details.dart';
import 'package:netflixclone/features/netflix/domain/entity/api/tv_show/tvshow_details.dart';

class MoreviewScreen extends StatelessWidget {
  final MovieDetails? movieDetails;
  final TvshowDetails? tvshowDetails;
  const MoreviewScreen({super.key, this.movieDetails, this.tvshowDetails});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.greyColor,
        appBar: AppBar(
          leading: SizedBox.shrink(),
          backgroundColor: AppColors.greyColor,
          title: Text(
          movieDetails!=null?  movieDetails!.title_!:tvshowDetails!.name_!,
            style: TextStyle(color: AppColors.whiteColor),
          ),
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: AppColors.whiteColor,
            fontSize: 24,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              style: IconButton.styleFrom(
                foregroundColor: AppColors.whiteColor,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.close),
            ),
          ],
        ),
        body: movieDetails!=null? ListView(
          children: [
            if (movieDetails!.cast_.isNotEmpty)
              MoreField(title: 'Cast', names: movieDetails!.cast_, isCast: true),
            if (movieDetails!.director_!.isNotEmpty)
              MoreField(title: 'Director', names: [movieDetails!.director_]),
            if (movieDetails!.writers_.isNotEmpty)
              MoreField(title: 'Writers', names: movieDetails!.writers_),

            if (movieDetails!.maturityRating_!.isNotEmpty)
              MaturityRating(maturityRating: movieDetails!.maturityRating_),
            if (movieDetails!.genres_.isNotEmpty)
              MoreField(title: 'Genres', names: movieDetails!.genres_),
            if (movieDetails!.tagline_!.isNotEmpty)
              MoreField(title: 'This movie is', names: [movieDetails!.tagline_]),
          ],
        ):ListView(
          children: [
            if (tvshowDetails!.casts_.isNotEmpty)
              MoreField(title: 'Cast', names: tvshowDetails!.casts_, isCast: true),
            if (tvshowDetails!.creator_!.isNotEmpty)
              MoreField(title: 'Creator', names: [tvshowDetails!.creator_]),

            if (tvshowDetails!.maturityRating_!.isNotEmpty)
              MaturityRating(maturityRating: tvshowDetails!.maturityRating_),
            if (tvshowDetails!.genres_.isNotEmpty)
              MoreField(title: 'Genres', names: tvshowDetails!.genres_),
          ],
        ),
      ),
    );
  }
}

class MaturityRating extends StatelessWidget {
  final String? maturityRating;
  const MaturityRating({super.key, required this.maturityRating});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Text(
            "Maturity Rating",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor,
              fontSize: 24,
            ),
          ),
        ),
        Text(
          maturityRating!,
          style: TextStyle(
            color: AppColors.whiteColor,
            fontSize: 24,
            backgroundColor: const Color.fromARGB(255, 56, 60, 62),
          ),
        ),
      ],
    );
  }
}

class MoreField extends StatelessWidget {
  final List<String?> names;
  final String? title;
  final bool isCast;
  const MoreField({
    super.key,
    required this.names,
    required this.title,
    this.isCast = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18),
          child: Text(
            title!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: AppColors.whiteColor,
              fontSize: 24,
            ),
          ),
        ),
        ...List.generate(
          isCast ? (names.length < 10 ? names.length : 10) : names.length,
          (index) => Text(names[index]!, style: TextStyle(fontSize: 20)),
        ),
      ],
    );
  }
}
