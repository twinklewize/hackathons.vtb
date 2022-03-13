import 'package:flutter/material.dart';

class HomeViewModel with ChangeNotifier {
  String _selectedPage = "Лента";

  String get selectedPage {
    String copy = _selectedPage;
    return copy;
  }

  void selectPage(String newPage) {
    _selectedPage = newPage;
    notifyListeners();
  }
}
