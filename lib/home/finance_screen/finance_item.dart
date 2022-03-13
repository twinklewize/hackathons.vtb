import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vtb_hackathon/data/companies/companies.dart';
import 'package:vtb_hackathon/data/player/player.dart';

// класс для купленных пользователем акций
class FinanceItem {
  FinanceItem({
    required this.name,
    required this.buyAmount,
  });

  // Название компании
  String name;
  // Цена покупки акций
  double buyAmount;

  String imageURI(BuildContext context, String name) {
    return Provider.of<Companies>(context, listen: false)
        .companies
        .firstWhere((company) => company.name == name)
        .imageURI;
  }

  double percentOfIncreasing(BuildContext context, String name) {
    return Provider.of<Companies>(context, listen: false)
        .percentOfIncreasing(name);
  }

  void buyStonk(String name, double buyAmount, BuildContext context) {
    Provider.of<Player>(context, listen: false).buyStonk(name, buyAmount);
  }
}
