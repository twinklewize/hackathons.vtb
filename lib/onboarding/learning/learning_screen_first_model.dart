import 'package:flutter/material.dart';
import 'dart:math';
import '../cats/cat_phrases_model.dart';

class LearningScreenFirstModel with ChangeNotifier {
  static bool _isFirstStep = true;

  static String _userName = 'пользователь';
  static int _userSalary = 10000;
  static int _userMoney = 10000;

  static int _grechkaPrice = 50;
  static int _bankPrice = (_userSalary / 100).round() + 25;
  static int _matrasPrice = (_userSalary / 100).round() + 50;

  static int _matrasMoney = 0;
  static int _bankMoney = 0;
  static int _grechkaCount = 0;

  static int _year = 2021;

  get isFirstStep {
    return _isFirstStep;
  }

  void nextYear(CatPhrasesModel catPhrases) {
    _year += 1;
    int r = 2 + Random().nextInt(10 - 2);
    _grechkaPrice = (grechkaPrice * (r + 100) / 100).round();
    _bankMoney = (_bankMoney * 1.06).round();
    if (_matrasMoney > (_userSalary / 2)) {
      catPhrases.setfirstCatIsGood(true);
      catPhrases.setPhrases([
        'Кажется в твой дом забрались воры и украли все твои деньги',
        'Нужно просто хранить их в вентиляции, а не под таким очевидным местом как матрас',
        'О нет, не слушай его, если не воры, то инфляции точно тебя ограбит. Видишь как растут цены на гречку. Ни в коем случае не давай деньгам просто так лежать. А если хочешь спасти их от инфляции лучше всего вкладываться в облигации'
      ]);
      _matrasMoney = 0;
    }
    if (_bankMoney > (_userSalary / 2)) {
      catPhrases.setfirstCatIsGood(true);
      catPhrases.setPhrases([
        'Хранить деньги в банке не такое уж и плохое решение. Но есть способы наааамного выгоднее.'
      ]);
    }
    if (_userMoney < _bankPrice &&
        _userMoney < _matrasPrice &&
        _userMoney < _grechkaPrice) {
      if (_bankMoney > _matrasMoney &&
          _bankMoney > grechkaPrice * grechkaCount) {
        catPhrases.setfirstCatIsGood(true);
        catPhrases.setPhrases([
          'Кажется ты положил большую часть своих денег в банк, это даже помогло тебе преодолеть инфляцию. Что ж в банке ВТБ действительно хорошие ставки по вкладам',
          'Ты не так глуп как я думал. Хе-хе-хе',
          'Теперь ты готов перейти к следующему этапу. Я видишь ли обходил тему инвестиций, но ты и сам давно понял куда я клоню.',
          'Но сначала выведем твои деньги из банка.',
          'О нет, я бы пожалуй немного денег оставил в банке как подушку безопасности.',
        ]);
        _isFirstStep = false;
      }
      if (_bankMoney < _matrasMoney &&
          _matrasMoney > grechkaPrice * grechkaCount) {
        catPhrases.setfirstCatIsGood(true);
        catPhrases.setPhrases([
          'Я смотрю бесстрашия тебе не занимать, все еще хранишь деньги под матрасом? Давай я помогу тебе их оттуда вытащить.',
        ]);
      }
      if (_bankMoney < grechkaPrice * grechkaCount &&
          _matrasMoney < grechkaPrice * grechkaCount) {
        catPhrases.setfirstCatIsGood(true);
        catPhrases.setPhrases([
          'Оказывается хранить деньги в гречке действительно неплохое решение',
          'О да, полностью поддерживаю, всю жизнь бы питался только гречкой',
          'Правда что делать с таким количество гречки, неужели ты собираешься ее продавать? Давай взглянем на что-то более выгодное, чем хранение денег в гречке. ИНВЕСТИЦИИ!',
        ]);
      }
    }
    if (_userMoney < _bankPrice &&
        _userMoney < _matrasPrice &&
        _userMoney < _grechkaPrice) {
      _isFirstStep = false;
    }
    notifyListeners();
  }

  get year {
    return _year;
  }

  get matrasMoney {
    return _matrasMoney;
  }

  get bankMoney {
    return _bankMoney;
  }

  get grechkaCount {
    return _grechkaCount;
  }

  void setMatrasMoney() {
    if (_matrasPrice > userMoney) return;
    _userMoney -= _matrasPrice + _userMoney % _matrasPrice;
    _matrasMoney += _matrasPrice + _userMoney % _matrasPrice;
    notifyListeners();
  }

  void setBankMoney() {
    if (_bankPrice > userMoney) return;
    _userMoney -= _bankPrice + _userMoney % _bankPrice;
    _bankMoney += _bankPrice + _userMoney % _bankPrice;
    notifyListeners();
  }

  void buyGrechka() {
    if (10 * grechkaPrice > userMoney) return;
    _userMoney -= 10 * _grechkaPrice;
    _grechkaCount += 10;
    notifyListeners();
  }

  void setUserName(String userName) {
    _userName = userName;
  }

  void setUserSalary(int userSalary) {
    _userSalary = userSalary;
    _userMoney = (userSalary * 4 / 3).round();
  }

  void setUserMoney(int userMoney) {
    _userMoney = userMoney;
    notifyListeners();
  }

  get userName {
    return _userName;
  }

  get userMoney {
    return _userMoney;
  }

  get grechkaPrice {
    return _grechkaPrice;
  }
}
