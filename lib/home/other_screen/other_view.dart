import 'package:flutter/material.dart';
import 'package:vtb_hackathon/consts/vtb_colors.dart';
import 'package:vtb_hackathon/home/other_screen/achievments_view.dart';
import 'package:vtb_hackathon/home/other_screen/rating_view.dart';

class OtherView extends StatelessWidget {
  const OtherView({Key? key}) : super(key: key);

  Widget otherListTile(
    BuildContext context,
    String title,
    IconData icon,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Container(
        width: MediaQuery.of(context).size.width - 30,
        height: 50,
        decoration: const BoxDecoration(
            color: VTBColors.color5,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Row(
          children: [
            const SizedBox(width: 15),
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(width: 10),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
            const Expanded(child: SizedBox()),
            const Icon(
              Icons.chevron_right_sharp,
              color: Colors.white,
            ),
            const SizedBox(width: 15),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Заголовок
        Padding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 27,
            left: 15,
            right: 15,
            bottom: 20,
          ),
          child: Row(
            children: const [
              Text(
                'Прочее',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: VTBColors.color5,
                ),
              ),
            ],
          ),
        ),

        otherListTile(context, 'Профиль', Icons.supervised_user_circle),
        const SizedBox(height: 10),

        otherListTile(context, 'Анализ портфеля', Icons.pie_chart),
        const SizedBox(height: 10),

        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const AcievmentsView(),
              ),
            );
          },
          child: otherListTile(
            context,
            'Достижения',
            Icons.kitesurfing,
          ),
        ),
        const SizedBox(height: 10),

        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute<void>(
                builder: (BuildContext context) => const RatingView(),
              ),
            );
          },
          child: otherListTile(context, 'Рейтинг', Icons.bar_chart),
        ),
        const SizedBox(height: 10),

        otherListTile(context, 'Маскоты', Icons.help),
        const SizedBox(height: 10),

        otherListTile(context, 'Настройки', Icons.settings),
        const SizedBox(height: 10),
      ],
    );
  }
}
