class GameDetails {
  final String title;
  final String descr;
  final String genre;
  final String thumbnail;
  final List<String> screenshots;
  final String url;
  final DateTime releaseDate;
  final String developer;

  GameDetails({
    required this.title,
    required this.descr,
    required this.genre,
    required this.screenshots,
    required this.thumbnail,
    required this.url,
    required this.releaseDate,
    required this.developer,
  });
}
