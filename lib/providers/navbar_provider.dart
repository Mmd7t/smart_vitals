import 'package:flutter/material.dart';

class NavBarProvider extends ChangeNotifier {
  int _cIndex = 1;

  int get cIndex => _cIndex;

  void setCIndex(index) {
    _cIndex = index;
    notifyListeners();
  }
}
