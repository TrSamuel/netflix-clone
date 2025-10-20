import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/core/theme/app_theme.dart';
import 'package:netflixclone/features/netflix/presentation/provider/bottomnav_provider.dart';
import 'package:netflixclone/features/netflix/presentation/screens/main_screen/main_screen.dart';
import 'package:provider/provider.dart';




Future<void> main() async {
  runApp(NetflixApp());

}

class NetflixApp extends StatelessWidget {
  const NetflixApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => BottomnavProvider()),
      ],
      child: MaterialApp(
        theme: AppTheme.themeData,
        debugShowCheckedModeBanner: false,
        home: MainScreen(),
      ),
    );
  }
}
