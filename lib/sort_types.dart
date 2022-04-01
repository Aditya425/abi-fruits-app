import 'package:flutter/material.dart';

class SortTypes extends ChangeNotifier {
  String sortType = "NAME_ASCENDING";
  void changeType(String newType) {
    sortType = newType;
    notifyListeners();
  }
}