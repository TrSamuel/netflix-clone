import 'package:flutter/material.dart';

class Itemprevieprovider extends ChangeNotifier {
  bool movieDetailsPreview = false;
  bool tvDetailsPreview = false;
  bool gameDetailsPreview = false;

  viewMovieDetails() {
    movieDetailsPreview = true;
    tvDetailsPreview = false;
    gameDetailsPreview = false;
    notifyListeners();
  }

  viewTVDetails() {
    movieDetailsPreview = false;
    tvDetailsPreview = true;
    gameDetailsPreview = false;
    notifyListeners();
  }

  viewGameDetails() {
    movieDetailsPreview = false;
    tvDetailsPreview = false;
    gameDetailsPreview = true;
    notifyListeners();
  }
}
