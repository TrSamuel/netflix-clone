import 'package:flutter/cupertino.dart';
import 'package:netflixclone/features/netflix/presentation/provider/bottomnav_provider.dart';
import 'package:provider/provider.dart';

class BuildPageWidget extends StatelessWidget {
  const BuildPageWidget({super.key, required this.pages});

  final List<Widget> pages;

  @override
  Widget build(BuildContext context) {
    return Consumer<BottomnavProvider>(
      builder: (_, instance, _) =>
          IndexedStack(index: instance.index, children: pages),
    );
  }
}
