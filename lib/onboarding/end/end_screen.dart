import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vtb_hackathon/consts/vtb_colors.dart';
import 'package:vtb_hackathon/onboarding/cats/cat_phrases_model.dart';
import 'package:vtb_hackathon/onboarding/learning/learning_screen_content.dart';

import '../cats/cats_widget.dart';

// ignore: use_key_in_widget_constructors
class EndScreen extends StatelessWidget {
  static const routeName = '/onboarding/end_screen';

  @override
  Widget build(BuildContext context) {
    final catPhrases = Provider.of<CatPhrasesModel>(
      context,
      listen: true,
    );

    catPhrases.setPhrases([
      'Поздравляю, ты прошел игру и пришел к своей цели.',
      'Для того, чтобы зарабатывать на инвестициях настоящие деньги скачивай приложение ВТБ банка МОИ ИНВЕСТИЦИИ',
      'А так же присоединяйся к школе инвестора от ВТБ банка',
      'Мы ждем тебя!'
    ]);

    return Scaffold(
      backgroundColor: Colors.white,
      body: CatsWidget(
        child: Expanded(
          child: Center(
            child: Column(
              children: [
                Container(
                  width: 200,
                  height: 200,
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Image.asset("assets/images/logo.png"),
                ),
                Container(
                  width: 200,
                  height: 200,
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Image.asset("assets/images/logo.png"),
                ),
                Container(
                  width: 200,
                  height: 200,
                  margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Image.asset("assets/images/logo.png"),
                ),
              ],
            ),
          ),
          //Container(color: VTBColors.color9),
        ),
      ),
    );
  }
}
