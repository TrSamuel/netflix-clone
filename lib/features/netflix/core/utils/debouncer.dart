import 'dart:async';

import 'package:flutter/widgets.dart';

class Debouncer {
  Timer? timer;
  final int milliseconds;

  Debouncer({required this.milliseconds});

  run(VoidCallback fun) {
    timer?.cancel();
    timer = Timer(Duration(milliseconds: milliseconds), fun);
  }
}
