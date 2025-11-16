import 'package:flutter/material.dart';

class NewhotTabProvider extends ChangeNotifier{
  int index=0;
  changeIndex(int index){
    this.index=index;
    notifyListeners();
  }
}