import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflixclone/features/netflix/core/color/app_colors.dart';
import 'package:netflixclone/features/netflix/core/utils/cache_manager.dart';
import 'package:netflixclone/features/netflix/core/utils/game_category.dart';
import 'package:netflixclone/features/netflix/domain/entity/api/game/game.dart';
import 'package:netflixclone/features/netflix/presentation/service/game_fetcher.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/main_screen/newhot/action_btn.dart';

class Games extends StatefulWidget {
  const Games({super.key});

  @override
  State<Games> createState() => _GamesState();
}

class _GamesState extends State<Games> with AutomaticKeepAliveClientMixin {
  late final Future<List<Game>> future;

  @override
  void initState() {
    future = GameFetcher.getGames(GameCategory.all);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.sizeOf(context).width * 0.35),
      color: AppColors.otherBgColor,
      child: FutureBuilder(
        future: future,
        builder: (context, snapshot) {
          if (!snapshot.hasData || snapshot.hasError) {
            return Center(child: Text("No any new games"));
          }
          final List<Game> games = snapshot.data!;
          return SingleChildScrollView(
            child: Column(
              children: List.generate(games.length, (index) {
                final Game game = games[index];
                return GameItem(game: game);
              }),
            ),
          );
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}

class GameItem extends StatelessWidget {
  const GameItem({super.key, required this.game});

  final Game game;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CachedNetworkImage(
              memCacheWidth: 600,
              width: MediaQuery.sizeOf(context).width * .95,
              imageUrl: game.thumbnail,
              fit: BoxFit.cover,
              cacheManager: customCacheManager,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 150,
                    child: Text(
                      game.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      style: GoogleFonts.lexend(
                        color: AppColors.whiteColor,
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      ActionBtn(icon: Icons.share, label: 'Share'),
                      ActionBtn(icon: Icons.info, label: 'Info'),
                      ActionBtn(icon: Icons.download, label: 'Get Game'),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: MediaQuery.sizeOf(context).width * 0.7,
                    child: Text(
                      game.descr,
                      style: GoogleFonts.notoSans(
                        color: AppColors.whiteColor,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(height: 20),
      ],
    );
  }
}
