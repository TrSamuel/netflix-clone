import 'package:flutter/material.dart';
import 'package:netflixclone/features/netflix/presentation/provider/bottomnav_provider.dart';
import 'package:netflixclone/features/netflix/presentation/widgets/download_screen/download_logo.dart';
import 'package:provider/provider.dart';

class EmptyDView extends StatelessWidget {
  const EmptyDView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DownloadLogo(),
          SizedBox(height: 45),
          Text(
            "Movies and TV shows that\nyou download appear here.",
            style: TextStyle(
              color: const Color.fromARGB(255, 146, 146, 146),
              fontSize: 21,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 85),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              shape: LinearBorder(),
              foregroundColor: Colors.black,
            ),
            onPressed: () {
              context.read<BottomnavProvider>().changeIndex(0);
              Navigator.pop(context);
            },
            child: Text(
              "Find Something to Download",
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 17),
            ),
          ),
        ],
      ),
    );
  }
}
