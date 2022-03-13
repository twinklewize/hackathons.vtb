import 'package:flutter/material.dart';
import 'package:vtb_hackathon/consts/vtb_colors.dart';

class RatingView extends StatelessWidget {
  const RatingView({Key? key}) : super(key: key);

  Widget buildList(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        buildItem('Джефф Безос', 'Капитализация активов: \$177 млрд', context),
        buildItem('Илон Маск', 'Капитализация активов: \$151 млрд', context),
        buildItem('Бернар Арно и семья', 'Капитализация активов: \$150 млрд',
            context),
        buildItem('Билл Гейтс', 'Капитализация активов: \$124 млрд', context),
        buildItem(
            'Марк Цукерберг', 'Капитализация активов: \$97 млрд', context),
        buildItem('Уоррен Баффет', 'Капитализация активов: \$96 млрд', context),
        buildItem('Ларри Эллисон', 'Капитализация активов: \$93 млрд', context),
        buildItem('Ларри Пейдж', 'Капитализация активов: \$91,5 млрд', context),
        buildItem('Сергей Брин', 'Капитализация активов: \$89 млрд', context),
        buildItem(
            'Мукеш Амбани', 'Капитализация активов: \$84,5 млрд', context),
      ],
    );
  }

  Widget buildItem(String name, String howMuch, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      child: Container(
        //height: 50,
        constraints: const BoxConstraints(minHeight: 50),
        width: MediaQuery.of(context).size.width - 30,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10)),
          color: VTBColors.color5,
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 15, top: 8, bottom: 8, right: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                name,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                howMuch,
                textAlign: TextAlign.start,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
                top: MediaQuery.of(context).padding.top + 27,
                left: 15,
                right: 15,
                bottom: 0,
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.chevron_left_sharp,
                    size: 32,
                    color: VTBColors.color5,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Рейтинг',
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

          SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.height -
                  (MediaQuery.of(context).padding.top) -
                  83,
              child: buildList(context),
            ),
          ),
        ],
      ),
    );
  }
}

class Achievment {
  String title;
  String description;

  Achievment(
    this.title,
    this.description,
  );
}
