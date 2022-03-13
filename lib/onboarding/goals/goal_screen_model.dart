import 'package:flutter/foundation.dart';

class Goal {
  Goal(this.goal, this.goalPrice);
  String goal = '';
  int goalPrice = 0;
}

class GoalScreenModel with ChangeNotifier {
  List<Goal> _items = [];

  get items {
    return [..._items];
  }

  addGoal(String goal, int price) {
    _items.add(Goal(goal, price));
    notifyListeners();
  }

  deleteGoal(String goal) {
    final existingProductIndex = _items.indexWhere((prod) => prod.goal == goal);
    _items.removeAt(existingProductIndex);
    notifyListeners();
  }
}
