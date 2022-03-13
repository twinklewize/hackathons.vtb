import 'package:flutter/material.dart';

class CatPhrasesModel with ChangeNotifier {
  static List<String> _phrases = [''];
  static bool _noCats = false;
  static bool _firstCatIsGood = true;

  void setfirstCatIsGood(bool firstCatIsGood) {
    _firstCatIsGood = firstCatIsGood;
    notifyListeners();
  }

  get firstCatIsGood {
    return _firstCatIsGood;
  }

  void setNoCats(bool noCats) {
    _noCats = noCats;
    notifyListeners();
  }

  get noCats {
    return _noCats;
  }

  void setPhrases(List<String> phrases) {
    _phrases = phrases;
    _noCats = false;
    notifyListeners();
  }

  get phrases {
    return _phrases;
  }
}
