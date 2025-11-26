import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/data/source/local/dowload_db.dart';
import 'package:netflixclone/features/netflix/netflix_app.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DowloadDb.instance.initDb();
  runApp(NetflixApp());
}
