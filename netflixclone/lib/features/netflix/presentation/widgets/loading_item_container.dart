import 'dart:async';

import 'package:flutter/material.dart';

class LoadingItemContainer extends StatefulWidget {
  const LoadingItemContainer({super.key});

  @override
  State<LoadingItemContainer> createState() => _LoadingItemState();
}

class _LoadingItemState extends State<LoadingItemContainer> {
  Alignment begin = Alignment.bottomLeft;
  Alignment end = Alignment.topRight;
  Timer? timer;
  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        begin = begin == Alignment.bottomLeft
            ? Alignment.topRight
            : Alignment.bottomLeft;

        end = end == Alignment.topRight
            ? Alignment.bottomLeft
            : Alignment.topRight;
      });
    });
  }

  @override
  void dispose() {
    timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 2),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: begin,
          end: end,
          colors: [
            const Color.fromARGB(255, 55, 63, 67),
            const Color.fromARGB(255, 82, 100, 109),
          ],
        ),
      ),
    );
  }
}
