import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vtb_hackathon/data/companies/companies.dart';
import 'package:vtb_hackathon/data/companies/company.dart';
import 'package:vtb_hackathon/data/stonks/stonks_item.dart';
import 'package:vtb_hackathon/home/other_screen/achievments_view.dart';

class Player with ChangeNotifier {
  // ! Главная цель

  String _target = 'Купить машину';
  // ignore: prefer_final_fields
  double _targetCost = 0;

  String get target {
    String copy = _target;
    return copy;
  }

  void setTarget(String newTarget) {
    _target = newTarget;
    notifyListeners();
  }

  double get targetCost {
    double copy = _targetCost;
    return copy;
  }

  void setTargetCost(double newTargetCost) {
    _targetCost = newTargetCost;
    notifyListeners();
  }

  // ! Подушка безопасности

  double _safetyPillow = 0;

  double get safetyPillow {
    double copy = _safetyPillow;
    return copy;
  }

  // ! Свободные деньги

  double _freeMoney = 0;

  double get freeMoney {
    double copy = _freeMoney;
    return copy;
  }

  void setFreeMoney(double newFreeMoney) {
    _freeMoney = newFreeMoney;
    notifyListeners();
  }

  void increaseSafetyPillow() {
    _safetyPillow += _freeMoney * 0.1;
    _freeMoney = _freeMoney * 0.9;
    notifyListeners();
  }

  void decreaseSafetyPillow() {
    _freeMoney += _safetyPillow * 0.1;
    _safetyPillow = _safetyPillow * 0.9;
    notifyListeners();
  }

  // ! Покупка и продажа акций

  void buyStonk(
    String name,
    double buyAmount,
  ) {
    stonks.add(StonksItem(
      name: name,
      buyAmount: buyAmount,
      counter: 1,
    ));
    _freeMoney -= buyAmount;
    notifyListeners();
  }

  void sellStonk(
    int index,
    double sellAmount,
    BuildContext context,
  ) {
    stonks.removeAt(index);
    _freeMoney += sellAmount;

    notifyListeners();
  }

  // ! Акции у игрока

  List<StonksItem> stonks = [
    // StonksItem(
    //   name: 'Газпром',
    //   buyAmount: 112.17,
    //   counter: 1,
    // ),
  ];

  // сколько всего денег вложено в акции
  double howMuchMoneyInStonks(
    BuildContext context,
  ) {
    List<Company> companies =
        Provider.of<Companies>(context, listen: false).companies;
    double sum = 0;
    for (var company in companies) {
      int counter = 0;
      for (var stonk in stonks) {
        if (company.name == stonk.name) counter++;
      }
      sum += counter * company.stonksData.last.open;
    }
    return sum;
  }

  // ! Ачивки

  List<Achievment> achievments = [
    Achievment(
      'Начало пути',
      'Ура, первая сделка совершена',
    ),
    Achievment(
      'Игрок на бирже',
      'Очень интересное вложение… Посмотрим, что из этого выйдет',
    ),
    Achievment(
      'Профессиональный акционер',
      'У вас есть акции 10 разных компаний! Неплохо для начала',
    ),
    Achievment(
      'На верном пути',
      'Общая стоимость всех вложений более 100000. Уверен, эти инвестиции принесут вам успех',
    ),
    Achievment(
      'Снова в школу?',
      'Вы приобрели первый портфель. Ах, какие воспоминания…',
    ),
    Achievment(
      'Успех',
      'Общая прибыль от инвестиций составила 100 тысяч. А вы молодец!',
    ),
    Achievment(
      'Акула бизнеса',
      'Общая прибыль от инвестиций дошла до миллиона! Вам явно везет!',
    ),
    Achievment(
      'Мечты сбываются',
      'Вы исполнили первую цель. Ну вот, а куда же двигаться дальше?',
    ),
    Achievment(
      'Весь мир у ваших ног',
      'Общая стоимость инвестиций превысила 1000000. Откуда у вас вообще столько денег?',
    ),
  ];
}
