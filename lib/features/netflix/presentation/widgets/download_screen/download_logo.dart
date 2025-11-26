import 'package:flutter/material.dart';

class DownloadLogo extends StatelessWidget {
  const DownloadLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 170,
          height: 170,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 31, 31, 31),
            borderRadius: BorderRadius.circular(500),
          ),
        ),
        Icon(Icons.download, size: 75),
      ],
    );
  }
}
