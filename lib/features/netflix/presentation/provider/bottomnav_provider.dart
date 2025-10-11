import 'package:flutter/cupertino.dart';

class BottomnavProvider extends ChangeNotifier {
  int index = 0;

  changeIndex(int index) {
    this.index = index;
    notifyListeners();
  }
}
