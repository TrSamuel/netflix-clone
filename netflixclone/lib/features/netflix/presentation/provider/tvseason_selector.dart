import 'package:flutter/material.dart';

class TvseasonSelector extends ChangeNotifier {
  int seasonNo = 1;

  void changeSeason(int seasonNo) {
    this.seasonNo = seasonNo;
    notifyListeners();
  }
}
