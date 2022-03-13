import 'package:flutter/material.dart';
import 'dart:math';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:vtb_hackathon/consts/vtb_colors.dart';
import 'package:vtb_hackathon/onboarding/cats/cat_phrases_model.dart';
import 'package:vtb_hackathon/onboarding/learning/learning_item_screen.dart';
import 'package:vtb_hackathon/onboarding/learning/learning_screen_second_model.dart';
import 'package:vtb_hackathon/widgets/long_button.dart';
import 'package:vtb_hackathon/widgets/square_button.dart';

import 'learning_screen_first_model.dart';

// ignore: use_key_in_widget_constructors
class LearningScreenContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<LearningScreenFirstModel>(
      context,
      listen: true,
    );

    final catPhrases = Provider.of<CatPhrasesModel>(
      context,
      listen: false,
    );

    final securitiesData = Provider.of<LearningScreenSecondModel>(
      context,
      listen: true,
    );

    return Column(
      children: [
        // Кнопки цели и текущая дата
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Кнопка Цели
            Padding(
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

            // Текущая дата
            Padding(
              padding: const EdgeInsets.only(right: 15, top: 57),
              child: Row(
                children: [
                  const Text(
                    'Текущая дата: ',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    userData.isFirstStep
                        ? '09.10.${userData.year}'
                        : '09.10.${securitiesData.year}',
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
              userData.isFirstStep
                  ? '${userData.userMoney} ₽'
                  : '${securitiesData.userMoney} ₽',
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 10),
            RotatedBox(
              quarterTurns: 1,
              child: SvgPicture.asset(
                'lib/assets/icons/minus.svg',
                height: 3,
                color: VTBColors.color5,
              ),
            ),
            const SizedBox(width: 10),
            SvgPicture.asset(
              'lib/assets/icons/pie_chart.svg',
              color: VTBColors.color5,
            ),
            const Expanded(child: SizedBox()),
          ],
        ),

        const SizedBox(height: 30),
        userData.isFirstStep
            ? Column(children: [
                Purse(
                  'Денег под матрасом',
                  '${userData.matrasMoney} ₽',
                  VTBColors.color4,
                ),
                Purse(
                  'Денег в банке',
                  '${userData.bankMoney}  ₽',
                  VTBColors.color3,
                ),
                Purse(
                  'Пачек гречки в кладовке',
                  '${userData.grechkaCount}',
                  VTBColors.color2,
                ),
              ])
            : Container(),

        !userData.isFirstStep
            ? Column(children: [
                Purse(
                  'Подушка безопасности',
                  '${securitiesData.airBag} ₽',
                  Colors.black,
                ),
                const SizedBox(height: 10),
                Purse(
                  'Денег вложено',
                  '${securitiesData.moneyInSecurities}  ₽',
                  Colors.black,
                ),
              ])
            : Container(),

        const SizedBox(height: 10),

        // Черточка
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Divider(
            thickness: 0.5,
            color: Colors.grey,
          ),
        ),

        !userData.isFirstStep
            ? Column(
                children: [
                  Button(
                    'Акции',
                    VTBColors.color4,
                    () {
                      // userData.setMatrasMoney();
                      // int r = 1 + Random().nextInt(20 - 1);
                      // if (r == 1) {
                      //   catPhrases.setfirstCatIsGood(false);
                      //   catPhrases.setPhrases([
                      //     'Нужно положить больше денег под матрс. БООООЛЬШЕ, ХЕ-ХЕ-ХЕ'
                      //   ]);
                      // }
                      // if (r == 2) {
                      //   catPhrases.setfirstCatIsGood(true);
                      //   catPhrases.setPhrases([
                      //     'Пожалуйста, хватит! Матрас ужасное место для твоих денег.'
                      //   ]);
                      //}
                      Navigator.of(context).pushNamed(
                        LearningItemScreen.routeName,
                        arguments: 1,
                      );
                    },
                  ),
                  Button(
                    'Облигации (ОФЗ)',
                    VTBColors.color3,
                    () {
                      Navigator.of(context).pushNamed(
                        LearningItemScreen.routeName,
                        arguments: 2,
                      );
                    },
                  ),
                  Button(
                    'Инвестиционные фонды',
                    VTBColors.color2,
                    () {
                      Navigator.of(context).pushNamed(
                        LearningItemScreen.routeName,
                        arguments: 3,
                      );
                    },
                  ),
                  Button(
                    'Готовые пакеты акций',
                    VTBColors.color1,
                    () {
                      Navigator.of(context).pushNamed(
                        LearningItemScreen.routeName,
                        arguments: 4,
                      );
                    },
                  ),
                ],
              )
            : Container(),

        userData.isFirstStep
            ? Column(children: [
                Button(
                  'Положить деньги под матрас',
                  VTBColors.color3,
                  () {
                    userData.setMatrasMoney();
                    int r = 1 + Random().nextInt(20 - 1);
                    if (r == 1) {
                      catPhrases.setfirstCatIsGood(false);
                      catPhrases.setPhrases([
                        'Нужно положить больше денег под матрс. БООООЛЬШЕ, ХЕ-ХЕ-ХЕ'
                      ]);
                    }
                    if (r == 2) {
                      catPhrases.setfirstCatIsGood(true);
                      catPhrases.setPhrases([
                        'Пожалуйста, хватит! Матрас ужасное место для твоих денег.'
                      ]);
                    }
                  },
                ),
                Button(
                  'Положить деньги в банк',
                  VTBColors.color2,
                  () {
                    userData.setBankMoney();
                    int r = 1 + Random().nextInt(20 - 1);
                    if (r == 1) {
                      catPhrases.setfirstCatIsGood(false);
                      catPhrases.setPhrases(
                          ['Возможно стоит вложится у гречку? ВУУ-ХА-ХА-ХА']);
                    }
                    if (r == 2) {
                      catPhrases.setfirstCatIsGood(true);
                      catPhrases.setPhrases(['Неплохой выбор!']);
                    }
                  },
                ),
                Button(
                  'Купить как можно больше гречки',
                  VTBColors.color1,
                  () {
                    userData.buyGrechka();
                    int r = 1 + Random().nextInt(20 - 1);
                    if (r == 1) {
                      catPhrases.setfirstCatIsGood(false);
                      catPhrases.setPhrases([
                        'О ДААА, ПРОДОООЛЖАААЙ, ВИЖУ ТЫ БОЛЬШОЙ ЛЮБИТЕЛЬ ГРЕЧКИ'
                      ]);
                    }
                    if (r == 2) {
                      catPhrases.setfirstCatIsGood(true);
                      catPhrases.setPhrases([
                        'А что ты собираешься делать с таким количеством гречки?'
                      ]);
                    }
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(
                      left: 15, right: 15, top: 10, bottom: 5),
                  child: Stack(
                    children: [
                      SizedBox(
                        width: 160,
                        height: 160,
                        child: Image.asset('assets/images/grechka.jpg'),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 0),
                        child: CircleAvatar(
                          backgroundColor: VTBColors.color8,
                          radius: 30,
                          child: Text(
                            '${userData.grechkaPrice} ₽',
                            style: const TextStyle(color: VTBColors.color1),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(
                    'На эти деньги вы можете купить ${(userData.userMoney / userData.grechkaPrice).round()} пачек гречки',
                    style: const TextStyle(color: VTBColors.color2),
                  ),
                ),
              ])
            : Container(),

        const Spacer(),

        Button(
          'Перемотать время',
          VTBColors.color5,
          () {
            userData.isFirstStep
                ? userData.nextYear(catPhrases)
                : securitiesData.nextYear(catPhrases, context);
          },
        ),
      ],
    );
  }
}

class Button extends StatelessWidget {
  String _text;
  Color color;
  Function onTap;
  Button(this._text, this.color, this.onTap);
  @override
  Widget build(BuildContext context) {
    return // кнопка перемотки времени
        Padding(
      padding: const EdgeInsets.only(
        bottom: 15,
      ),
      child: GestureDetector(
        onTap: () {
          onTap();
        },
        child: LongButton(
          color,
          true,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                _text,
                style: const TextStyle(
                  color: Colors.white,
                ),
              ),
              const SizedBox(width: 5),
            ],
          ),
        ),
      ),
    );
  }
}

class Purse extends StatelessWidget {
  String count;
  String text;
  Color color;
  Purse(this.text, this.count, this.color);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 15),
        Text(
          '$text: ',
          style: TextStyle(
            fontSize: 16,
            color: color,
          ),
        ),
        Text(
          '$count',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}
