import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vtb_hackathon/data/companies/companies.dart';

// класс для купленных пользователем акций
class StonksItem {
  StonksItem({
    required this.name,
    required this.buyAmount,
    required this.counter,
  });

  // Название компании
  String name;
  // Цена покупки акций
  double buyAmount;
  // Сколько акций в наличии
  int counter;

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
}
