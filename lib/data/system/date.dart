import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vtb_hackathon/data/companies/companies.dart';

class Date with ChangeNotifier {
  DateTime currentDate = DateTime(2020, 12, 26);

  void rollDate(BuildContext context) {
    currentDate = currentDate.add(const Duration(days: 7));
    Provider.of<Companies>(context, listen: false).rollTime(context);
    notifyListeners();
  }
}
