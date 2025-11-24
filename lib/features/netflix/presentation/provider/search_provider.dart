import 'package:flutter/material.dart';

class SearchProvider extends ChangeNotifier{
  String query='';

  getQuery(String query){
    this.query=query;
    notifyListeners();
  }
}