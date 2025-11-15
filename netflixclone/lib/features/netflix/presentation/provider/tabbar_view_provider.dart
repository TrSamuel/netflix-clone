import 'package:flutter/material.dart';

class TabbarViewProvider extends ChangeNotifier {
  int index = 0;

  void changeIndex(int index) {
    this.index = index;
    notifyListeners();
  }
}
