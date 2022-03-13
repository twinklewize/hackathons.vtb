import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vtb_hackathon/consts/vtb_colors.dart';
import 'package:vtb_hackathon/onboarding/learning/learning_screen_second_model.dart';
import 'package:vtb_hackathon/widgets/half_long_button.dart';

class LearningItemScreen extends StatelessWidget {
  static const routeName = '/onboarding/learning_item_screen';
  late String title;
  // ignore: use_key_in_widget_constructors

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context)!.settings.arguments as int;
    final securitiesData = Provider.of<LearningScreenSecondModel>(
      context,
      listen: true,
    );
    switch (id) {
      case 1:
        title = 'Акции';
        break;
      case 2:
        title = 'Облигации';
        break;
      case 3:
        title = 'Фонды';
        break;
      case 4:
        title = 'Пакеты акций';
    }
    return Scaffold(
      body: Column(
        children: [
          // Заголовок
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 15,
                left: 15,
                right: 15,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.chevron_left_sharp,
                    size: 32,
                    color: VTBColors.color5,
                  ),
                  SizedBox(width: 10),
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: VTBColors.color5,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Цена покупки
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 15,
              right: 15,
            ),
            child: Row(
              children: [
                const Text(
                  "Цена: ",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  '${securitiesData.securitiesPrice[id - 1]}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          // Сколько акций куплено
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
              left: 15,
              right: 15,
            ),
            child: Row(
              children: [
                const Text(
                  "Количество купленных: ",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  '${securitiesData.securitiesPurchased[id - 1]}',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),

          const Expanded(child: SizedBox()),

          // продажа и покупка акций
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    securitiesData.sellSecurities(id);
                  },
                  child: HalfLongButton(
                    Colors.red,
                    true,
                    const Text(
                      'Продать',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                const Expanded(child: SizedBox()),
                GestureDetector(
                  onTap: () {
                    securitiesData.buySecurities(id);
                  },
                  child: HalfLongButton(
                    VTBColors.color5,
                    true,
                    const Text(
                      'Купить',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
