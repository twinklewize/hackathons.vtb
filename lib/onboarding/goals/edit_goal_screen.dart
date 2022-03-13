import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vtb_hackathon/consts/vtb_colors.dart';
import 'package:vtb_hackathon/data/player/player.dart';
import 'package:vtb_hackathon/home/home_view.dart';
import 'package:vtb_hackathon/onboarding/cats/cat_phrases_model.dart';
import 'package:vtb_hackathon/onboarding/cats/cats_widget.dart';
import 'package:vtb_hackathon/onboarding/goals/goal_screen_model.dart';
import 'package:vtb_hackathon/widgets/long_button.dart';

import '../learning/learning_screen.dart';

// ignore: use_key_in_widget_constructors
class EditGoalScreen extends StatelessWidget {
  static const routeName = '/onboarding/goal_edit_screen';
  @override
  Widget build(BuildContext context) {
    Provider.of<CatPhrasesModel>(
      context,
      listen: true,
    );

    return Scaffold(
      body: CatsWidget(
        child: GoalEditScreenContent(),
      ),
    );
  }
}

class GoalEditScreenContent extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  String goal = '';
  int goalPrice = 0;

  @override
  Widget build(BuildContext context) {
    void _trySubmit() {
      final isValid = _formKey.currentState!.validate();
      FocusScope.of(context).unfocus(); //убрать фокус с полей

      if (isValid) {
        _formKey.currentState!.save();
        final goalData = Provider.of<GoalScreenModel>(
          context,
          listen: false,
        );
        goalData.addGoal(goal, goalPrice);
        final catPhrases = Provider.of<CatPhrasesModel>(
          context,
          listen: false,
        );
        catPhrases.setPhrases(
          [
            'Удачи! Я уверен ты придешь к своей цели. Причем не только в этой игре, но и в жизни!',
            'Приятной игры',
          ],
        );
        Navigator.of(context).pushReplacement(
          MaterialPageRoute<void>(
            builder: (BuildContext context) => HomeView(),
          ),
        );
      }
    }

    return Center(
      child: Card(
        color: VTBColors.color5,
        margin: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.length < 4) {
                        return 'Пожалуйста введите минимум 4 символа';
                      }
                      return null;
                    },
                    decoration: formFieldDecoration('Ваша цель'),
                    onSaved: (value) {
                      goal = value!;
                      Provider.of<Player>(context, listen: false)
                          .setTarget(value);
                    },
                  ),
                  const SizedBox(height: 15),
                  TextFormField(
                    validator: (value) {
                      if (value == null || int.parse(value) <= 0) {
                        return 'Число должно быть больше нуля';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.number,
                    decoration: formFieldDecoration('Стоймость вашей цели'),
                    onSaved: (value) {
                      goalPrice = int.parse(value!);
                      Provider.of<Player>(context, listen: false)
                          .setTargetCost(double.parse(value));
                      Provider.of<Player>(context, listen: false)
                          .setFreeMoney(double.parse(value) / 2);
                    },
                  ),
                  const SizedBox(height: 30),
                  Button('Подтвердить', VTBColors.color2, _trySubmit),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

InputDecoration formFieldDecoration(String labelText) {
  return InputDecoration(
    floatingLabelBehavior: FloatingLabelBehavior.never,
    errorStyle: const TextStyle(
      color: VTBColors.color8,
    ),
    labelText: labelText,
    labelStyle: const TextStyle(
      color: VTBColors.color1,
    ),
    fillColor: Colors.white,
    filled: true,
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide.none,
    ),
    disabledBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide.none,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: BorderSide.none,
    ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        color: VTBColors.color8,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide: const BorderSide(
        color: VTBColors.color8,
      ),
    ),
  );
}

class Button extends StatelessWidget {
  String _text;
  Color color;
  Function onTap;
  Button(this._text, this.color, this.onTap);
  @override
  Widget build(BuildContext context) {
    return Padding(
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
