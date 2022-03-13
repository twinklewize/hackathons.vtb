import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vtb_hackathon/consts/vtb_colors.dart';
import 'package:vtb_hackathon/onboarding/cats/cat_phrases_model.dart';
import 'package:vtb_hackathon/onboarding/learning/learning_screen_first_model.dart';
import 'package:vtb_hackathon/widgets/long_button.dart';

import '../learning/learning_screen.dart';

// ignore: use_key_in_widget_constructors
class AuthForm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  var _userName = '';
  int _userSalary = 0;

  @override
  Widget build(BuildContext context) {
    void _trySubmit() {
      final isValid = _formKey.currentState!.validate();
      FocusScope.of(context).unfocus(); //убрать фокус с полей

      if (isValid) {
        _formKey.currentState!.save();
        final userData = Provider.of<LearningScreenFirstModel>(
          context,
          listen: false,
        );
        userData.setUserName(_userName);
        userData.setUserSalary(_userSalary);

        Navigator.of(context).pushReplacementNamed(LearningScreen.routeName);
        final catPhrases = Provider.of<CatPhrasesModel>(
          context,
          listen: false,
        );
        catPhrases.setPhrases(
          [
            'Привет, ${userData.userName}, мой дорогой друг! Хочешь научиться финансовой грамотности?',
            'Мечтаешь стать богаче Илона Маска? Хе-хе-хе',
            'Мы поможем  сделать твои мечты реальностью',
            'Я смотрю ты накопил немного денег, ${userData.userMoney} не такая уж и маленькая сумма',
            'Давай посмотрим, что с ней можно сделать, у тебя есть 3 варианта!',
          ],
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
                    decoration: formFieldDecoration('Ваше имя'),
                    onSaved: (value) {
                      _userName = value!;
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
                    decoration: formFieldDecoration('Сколько вы зарабатываете'),
                    onSaved: (value) {
                      _userSalary = int.parse(value!);
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
