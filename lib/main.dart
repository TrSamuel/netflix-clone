import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/theme/app_theme.dart';
import 'package:netflixclone/features/netflix/data/source/local/dowload_db.dart';
import 'package:netflixclone/features/netflix/presentation/provider/bgcolor_changer.dart';
import 'package:netflixclone/features/netflix/presentation/provider/bottomnav_provider.dart';
import 'package:netflixclone/features/netflix/presentation/provider/download_provider.dart';
import 'package:netflixclone/features/netflix/presentation/provider/newhot_tab_provider.dart';
import 'package:netflixclone/features/netflix/presentation/provider/search_provider.dart';
import 'package:netflixclone/features/netflix/presentation/provider/tabbar_view_provider.dart';
import 'package:netflixclone/features/netflix/presentation/provider/tvseason_selector.dart';
import 'package:netflixclone/features/netflix/presentation/screens/main_screen/main_screen.dart';
import 'package:provider/provider.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DowloadDb.instance.initDb();
  runApp(NetflixApp());
}

class NetflixApp extends StatelessWidget {
  const NetflixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomnavProvider()),
        ChangeNotifierProvider(create: (context) => TabbarViewProvider()),
        ChangeNotifierProvider(create: (context) => TvseasonSelector()),
        ChangeNotifierProvider(create: (context) => NewhotTabProvider()),
        ChangeNotifierProvider(create: (context) => BgcolorChanger()),
        ChangeNotifierProvider(create: (context) => SearchProvider()),
        ChangeNotifierProvider(create: (context) => DownloadProvider()),
      ],
      child: MaterialApp(
        theme: AppTheme.themeData,
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    );
  }
}
