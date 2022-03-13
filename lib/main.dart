import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vtb_hackathon/data/companies/companies.dart';
import 'package:vtb_hackathon/data/player/player.dart';
import 'package:vtb_hackathon/data/system/date.dart';
import 'package:vtb_hackathon/home/feed_screen/feed_view_model.dart';
import 'package:vtb_hackathon/home/home_view.dart';
import 'package:vtb_hackathon/home/home_view_model.dart';
import 'package:vtb_hackathon/home/other_screen/other_view_model.dart';
import 'package:vtb_hackathon/onboarding/auth/auth_form_screen.dart';
import 'package:vtb_hackathon/onboarding/cats/cat_phrases_model.dart';
import 'package:vtb_hackathon/onboarding/end/end_screen.dart';
import 'package:vtb_hackathon/onboarding/goals/edit_goal_screen.dart';
import 'package:vtb_hackathon/onboarding/goals/goal_screen_model.dart';
import 'package:vtb_hackathon/onboarding/learning/learning_item_screen.dart';
import 'package:vtb_hackathon/onboarding/learning/learning_screen.dart';
import 'package:vtb_hackathon/onboarding/learning/learning_screen_first_model.dart';
import 'package:vtb_hackathon/onboarding/learning/learning_screen_second_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: HomeViewModel(),
        ),
        ChangeNotifierProvider.value(
          value: Player(),
        ),
        ChangeNotifierProvider.value(
          value: FeedViewModel(),
        ),
        ChangeNotifierProvider.value(
          value: OtherViewModel(),
        ),
        ChangeNotifierProvider.value(
          value: Date(),
        ),
        ChangeNotifierProvider.value(
          value: Companies(),
        ),
        ChangeNotifierProvider.value(
          value: GoalScreenModel(),
        ),
        ChangeNotifierProvider.value(
          value: LearningScreenFirstModel(),
        ),
        ChangeNotifierProvider.value(
          value: CatPhrasesModel(),
        ),
        ChangeNotifierProvider.value(
          value: LearningScreenSecondModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(),
        home: AuthFormScreen(),
        routes: {
          EndScreen.routeName: (ctx) => EndScreen(),
          EditGoalScreen.routeName: (ctx) => EditGoalScreen(),
          LearningScreen.routeName: (ctx) => LearningScreen(),
          LearningItemScreen.routeName: (ctx) => LearningItemScreen(),
        },
      ),
    );
  }
}
