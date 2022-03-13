import 'package:flutter/material.dart';
import 'package:vtb_hackathon/onboarding/goals/edit_goal_screen.dart';
import 'dart:math';
import '../cats/cat_phrases_model.dart';

class LearningScreenSecondModel with ChangeNotifier {
  static int _userMoney = 10000;
  static int _airBag = _userMoney;
  static int _moneyInSecurities = 0;
  static List<int> _securitiesPrice = [100, 140, 90, 200];
  static List<int> _securitiesPurchased = [0, 0, 0, 0];
  static int _year = 2021;

  get userMoney {
    return _userMoney;
  }

  get airBag {
    return _airBag;
  }

  get moneyInSecurities {
    return _moneyInSecurities;
  }

  get securitiesPrice {
    return _securitiesPrice;
  }

  get securitiesPurchased {
    return _securitiesPurchased;
  }

  get year {
    return _year;
  }

  void buySecurities(int id) {
    if (_airBag < _securitiesPrice[id - 1])
      return;
    else {
      _securitiesPurchased[id - 1] += 1;
      _airBag -= _securitiesPrice[id - 1];
      _moneyInSecurities += _securitiesPrice[id - 1];
    }
    notifyListeners();
  }

  void sellSecurities(int id) {
    if (_securitiesPurchased[id - 1] < 1)
      return;
    else {
      _securitiesPurchased[id - 1] -= 1;
      _airBag += _securitiesPrice[id - 1];
      _moneyInSecurities -= _securitiesPrice[id - 1];
    }
    notifyListeners();
  }

  void nextYear(CatPhrasesModel catPhrases, BuildContext context) {
    _year++;

    int r;
    r = 77 + Random().nextInt(131 - 77);
    _securitiesPrice[0] = (_securitiesPrice[0] * r / 100).round();
    r = 90 + Random().nextInt(111 - 90);
    _securitiesPrice[1] = (_securitiesPrice[1] * r / 100).round();
    r = 85 + Random().nextInt(116 - 84);
    _securitiesPrice[2] = (_securitiesPrice[2] * r / 100).round();
    r = 91 + Random().nextInt(114 - 90);
    _securitiesPrice[3] = (_securitiesPrice[3] * r / 100).round();

    _moneyInSecurities = 0;
    for (int i = 0; i < 4; i++) {
      _moneyInSecurities += _securitiesPrice[i] * _securitiesPurchased[i];
    }

    if (_airBag + _moneyInSecurities > 20000) {
      Navigator.of(context).pushReplacementNamed(EditGoalScreen.routeName);
      catPhrases.setPhrases([
        'Ты готов перейти к более серьезным испытанием. И потренироваться покупать акции разных компаний',
        'Не волнуйся, мы постарались все упростить специально для тебя',
        'Для того чтобы накопить большую сумму сначала нужно поставить цель',
        'Подумай, чего тебе хотелось бы больше всего',
      ]);
    }

    r = 1 + Random().nextInt(100 - 1);
    if (r == 2) {
      catPhrases.setfirstCatIsGood(false);
      catPhrases.setPhrases([
        'А ДАВАЙ ПОТРАТИМ ВСЕ ДЕНЬГИ НА АКЦИИ ГАЗПРОМА. СРОЧНО ВЫБИРАЙ РАЗДЕЛ АКЦИИ И СКУПАЙ ВСЁ! Я СЛЫШАЛ ОНИ СКОРО СИЛЬНО ВЫРАСТУТ',
        'О НЕЕЕТ! Не слушай его! Вкладывать все свои деньги в одну компанию ужасная идея!',
      ]);
    }

    if (r == 3) {
      catPhrases.setfirstCatIsGood(false);
      catPhrases.setPhrases([
        'Давай я помогу тебе собрать инвестиционный портфель. Хех. Нужно купить акции Samsung и Apple! Вот и потфель готов. Хе-хе-хе-хех. Думаю я отличный советник. Ты сказочно разбогатеешь',
        'Опять он лезет со своими советами. Запомни, собирая портфель акций важно вкладывать в максимально разные компании и отрасли.',
      ]);
    }

    if (_securitiesPurchased[0] >
            _securitiesPurchased[1] +
                _securitiesPurchased[2] +
                _securitiesPurchased[3] &&
        (r == 4 || r == 5)) {
      catPhrases.setfirstCatIsGood(true);
      catPhrases.setPhrases([
        'Вижу ты предпочитаешь вкладываться только в акции. Советую для начала присмотреться к пакетам акций. Разделять свои инвестиции между разными компаниями и сферами очень важно.'
      ]);
    }

    if (_securitiesPurchased[1] >
            _securitiesPurchased[0] +
                _securitiesPurchased[2] +
                _securitiesPurchased[3] &&
        (r == 4 || r == 5)) {
      catPhrases.setfirstCatIsGood(true);
      catPhrases.setPhrases([
        'Облигации это хороший выбор, если ты не хочешь сильно рисковать. Их надежность выше чем у акций, но и возможная прибыль меньше.'
      ]);
    }

    if (_securitiesPurchased[2] >
            _securitiesPurchased[0] +
                _securitiesPurchased[1] +
                _securitiesPurchased[3] &&
        (r == 4 || r == 5)) {
      catPhrases.setfirstCatIsGood(true);
      catPhrases.setPhrases([
        'Если вы еще начинающий инвестор, то инвестировать через фонды это хороший вариант. Когда поднаберетесь знаний можно переходить к покупке отдельных акций и повышению дохода.'
      ]);
    }

    if (_securitiesPurchased[3] >
            _securitiesPurchased[0] +
                _securitiesPurchased[1] +
                _securitiesPurchased[2] &&
        (r == 4 || r == 5)) {
      catPhrases.setfirstCatIsGood(true);
      catPhrases.setPhrases([
        'Готовые инвестиционные портфели пожалуй самый лучший вариант инвестиций. Ты сделал правильный выбор. Сотрудники банка ВТБ с радостью помогут подобрать идеальный для вас портфель акций.',
        'А еще портфели акций помогают регулировать соотношение рисков и доходности.',
        'А вот здесь он прав!',
      ]);
    }

    if (_userMoney > (_year + _moneyInSecurities) && r == 6) {
      catPhrases.setfirstCatIsGood(false);
      catPhrases.setPhrases([
        'Ты потерял немного денег, видимо стоит лучше выбирать во что вкладываться. Очень советую ГазПром, хе-хех-хех',
      ]);
    }

    if (_userMoney > _airBag + _moneyInSecurities && r == 6) {
      catPhrases.setfirstCatIsGood(true);
      catPhrases.setPhrases([
        'Тебе удалось заработать немного денег. Мои уроки не прошли зря',
      ]);
    }

    _userMoney = _airBag + _moneyInSecurities;
    notifyListeners();
  }
}
