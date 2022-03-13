import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:vtb_hackathon/consts/vtb_colors.dart';
import 'package:vtb_hackathon/data/player/player.dart';
import 'package:vtb_hackathon/data/stonks/stonks_item.dart';
import 'package:vtb_hackathon/data/system/date.dart';
import 'package:vtb_hackathon/home/main_screen/stonks_item_view.dart';
import 'package:vtb_hackathon/widgets/long_button.dart';
import 'package:vtb_hackathon/widgets/square_button.dart';

class MainView extends StatelessWidget {
  const MainView({Key? key}) : super(key: key);

  Widget buildList(
    BuildContext context,
    List<StonksItem> data,
  ) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: data.length,
      itemBuilder: (context, index) => stonksItem(
        context,
        Container(
          margin: const EdgeInsets.only(
            left: 15,
            right: 15,
            bottom: 8,
            top: 8,
          ),
          child: Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image: DecorationImage(
                    image: NetworkImage(
                        data[index].imageURI(context, data[index].name)),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(data[index].name),
              const Expanded(child: SizedBox()),
              Text(
                data[index].percentOfIncreasing(context, data[index].name) >= 0
                    ? "+ " +
                        data[index]
                            .percentOfIncreasing(context, data[index].name)
                            .toStringAsFixed(3) +
                        " %"
                    : "- " +
                        data[index]
                            .percentOfIncreasing(context, data[index].name)
                            .abs()
                            .toStringAsFixed(3) +
                        " %",
              ),
              const SizedBox(width: 10),
              SizedBox(
                height: 20,
                width: 20,
                child: data[index]
                            .percentOfIncreasing(context, data[index].name) >=
                        0
                    ? Image.asset('lib/assets/images/profit.png')
                    : Image.asset('lib/assets/images/not_stonks.png'),
              ),
            ],
          ),
        ),
        VTBColors.color9,
        index,
      ),
    );
  }

  Widget stonksItem(
    BuildContext context,
    Widget child,
    Color color,
    int index,
  ) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute<void>(
            builder: (BuildContext context) => StonksItemView(index),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2.5),
        child: Container(
          width: double.infinity,
          height: 50,
          decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(10))),
          child: child,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<StonksItem> stonks = Provider.of<Player>(context).stonks;
    return Column(
      children: [
        // Кнопки цели и текущая дата
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Кнопка Цели
            GestureDetector(
              onTap: () {
                Scaffold.of(context).openDrawer();
              },
              child: Padding(
                padding: EdgeInsets.only(
                  top: MediaQuery.of(context).padding.top + 15,
                  left: 15,
                ),
                child: SquareButton(
                  Colors.transparent,
                  true,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        'lib/assets/icons/target.svg',
                        color: VTBColors.color5,
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        'Цели',
                        style: TextStyle(
                          color: VTBColors.color5,
                        ),
                      ),
                    ],
                  ),
                  Colors.white,
                ),
              ),
            ),

            // Текущая дата
            Padding(
              padding: const EdgeInsets.only(right: 15, top: 57),
              child: Row(
                children: [
                  const Text(
                    'Текущая дата: ',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    DateFormat('dd.MM.yyyy')
                        .format(Provider.of<Date>(context).currentDate),
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 30),

        // Общая сумма и кнопка аналитики
        Row(
          children: [
            const Expanded(child: SizedBox()),
            Text(
              (Provider.of<Player>(context).freeMoney +
                          Provider.of<Player>(context).safetyPillow +
                          Provider.of<Player>(context)
                              .howMuchMoneyInStonks(context))
                      .toStringAsFixed(2) +
                  ' ₽',
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            // const SizedBox(width: 10),
            // RotatedBox(
            //   quarterTurns: 1,
            //   child: SvgPicture.asset(
            //     'lib/assets/icons/dash.svg',
            //     height: 3,
            //     color: VTBColors.color5,
            //   ),
            // ),
            // const SizedBox(width: 10),
            // SvgPicture.asset(
            //   'lib/assets/icons/pie_chart.svg',
            //   color: VTBColors.color5,
            // ),
            const Expanded(child: SizedBox()),
          ],
        ),

        const SizedBox(height: 30),

        // Подушка безопасности
        Row(
          children: [
            const SizedBox(width: 15),
            const Text(
              'Подушка безопасности: ',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              Provider.of<Player>(context).safetyPillow.toStringAsFixed(2) +
                  ' ₽',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                Provider.of<Player>(context, listen: false)
                    .decreaseSafetyPillow();
              },
              child: SvgPicture.asset(
                'lib/assets/icons/minus.svg',
                color: VTBColors.color5,
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                Provider.of<Player>(context, listen: false)
                    .increaseSafetyPillow();
              },
              child: SvgPicture.asset(
                'lib/assets/icons/plus.svg',
                color: VTBColors.color5,
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        // Всего в акциях
        Row(
          children: [
            const SizedBox(width: 15),
            const Text(
              'Всего в акциях: ',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              Provider.of<Player>(context)
                      .howMuchMoneyInStonks(context)
                      .toStringAsFixed(2) +
                  ' ₽',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        // Свободные деньги:
        Row(
          children: [
            const SizedBox(width: 15),
            const Text(
              'Свободные деньги: ',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            Text(
              Provider.of<Player>(context).freeMoney.toStringAsFixed(2) + ' ₽',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                Provider.of<Player>(context, listen: false)
                    .increaseSafetyPillow();
              },
              child: SvgPicture.asset(
                'lib/assets/icons/minus.svg',
                color: VTBColors.color5,
              ),
            ),
            const SizedBox(width: 10),
            GestureDetector(
              onTap: () {
                Provider.of<Player>(context, listen: false)
                    .decreaseSafetyPillow();
              },
              child: SvgPicture.asset(
                'lib/assets/icons/plus.svg',
                color: VTBColors.color5,
              ),
            ),
          ],
        ),

        const SizedBox(height: 10),

        // Черточка
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),
        ),

        SizedBox(
          height: MediaQuery.of(context).size.height -
              (MediaQuery.of(context).padding.top) -
              400,
          child: buildList(context, stonks),
        ),

        const Expanded(child: SizedBox()),

        // кнопка перемотки времени
        Padding(
          padding: const EdgeInsets.only(bottom: 15),
          child: InkWell(
            onTap: () {
              Provider.of<Date>(context, listen: false).rollDate(context);
            },
            child: LongButton(
              VTBColors.color5,
              true,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Перемотать время',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 5),
                  SvgPicture.asset(
                    'lib/assets/icons/time.svg',
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
