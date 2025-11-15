import 'package:flutter/material.dart';

class NewhotTabsChanger extends ChangeNotifier {
  int index = 0;

  void changeIndex(int index) {
    this.index = index;
    notifyListeners();
  }
}
