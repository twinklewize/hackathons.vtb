import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vtb_hackathon/onboarding/cats/cat_phrases_model.dart';
import 'package:vtb_hackathon/onboarding/learning/learning_screen_content.dart';

import '../cats/cats_widget.dart';
import 'learning_screen_first_model.dart';

// ignore: use_key_in_widget_constructors
class LearningScreen extends StatelessWidget {
  static const routeName = '/onboarding/learning_screen';

  @override
  Widget build(BuildContext context) {
    Provider.of<CatPhrasesModel>(
      context,
      listen: true,
    );
    Provider.of<LearningScreenFirstModel>(
      context,
      listen: false,
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: CatsWidget(
        child: LearningScreenContent(),
      ),
    );
  }
}
