import 'package:flutter/material.dart';

class TvseasonSelector extends ChangeNotifier {
  int seasonNo = 1;

  changeSeason(int seasonNo) {
    this.seasonNo = seasonNo;
    notifyListeners();
  }
}
