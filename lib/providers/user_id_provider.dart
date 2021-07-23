import 'package:flutter/material.dart';

class UserIdProvider extends ChangeNotifier {
  int _id = 0;

  int get id => _id;

  setId(id) {
    _id = id;

    notifyListeners();
  }
}
