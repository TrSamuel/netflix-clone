import 'package:flutter/material.dart';

class TabbarViewProvider extends ChangeNotifier {
  int index = 0;

  changeIndex(int index) {
    this.index = index;
    notifyListeners();
  }
}
