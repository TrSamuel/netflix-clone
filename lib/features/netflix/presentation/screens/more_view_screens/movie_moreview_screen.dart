import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';
import 'package:netflixclone/features/netflix/domain/entity/movie/movie_details.dart';

class MovieMoreviewScreen extends StatelessWidget {
  final MovieDetails movieDetails;
  const MovieMoreviewScreen({super.key, required this.movieDetails});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.greyColor,
        appBar: AppBar(
          leading: SizedBox.shrink(),
          backgroundColor: AppColors.greyColor,
          title: Text(
            movieDetails.title!,
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
        body: ListView(
          children: [
            if (movieDetails.cast.isNotEmpty)
              MoreField(title: 'Cast', names: movieDetails.cast, isCast: true),
            if (movieDetails.director!.isNotEmpty)
              MoreField(title: 'Director', names: [movieDetails.director]),
            if (movieDetails.writers.isNotEmpty)
              MoreField(title: 'Writers', names: movieDetails.writers),

            if (movieDetails.maturityRating!.isNotEmpty)
              MaturityRating(maturityRating: movieDetails.maturityRating),
            if (movieDetails.genres.isNotEmpty)
              MoreField(title: 'Genres', names: movieDetails.genres),
            if (movieDetails.tagline!.isNotEmpty)
              MoreField(title: 'This movie is', names: [movieDetails.tagline]),
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
