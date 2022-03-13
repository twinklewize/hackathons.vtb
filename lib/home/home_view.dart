import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vtb_hackathon/home/feed_screen/feed_view.dart';
import 'package:vtb_hackathon/home/finance_screen/finance_view.dart';
import 'package:vtb_hackathon/home/home_view_model.dart';
import 'package:vtb_hackathon/home/main_screen/main_view.dart';
import 'package:vtb_hackathon/home/main_screen/targets_drawer.dart';
import 'package:vtb_hackathon/home/other_screen/other_view.dart';
import 'package:vtb_hackathon/widgets/vtb_tabbar.dart';

// ignore: must_be_immutable
class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  String page = "Главный";

  @override
  Widget build(BuildContext context) {
    page = Provider.of<HomeViewModel>(context).selectedPage;
    return Scaffold(
      drawer: TargetsDrawer(),
      bottomNavigationBar: Tabbar(page),
      body: (page == "Главный")
          ? const MainView()
          : (page == "Лента")
              ? const FeedView()
              : (page == "Биржа")
                  ? const FinanceView()
                  : (page == "Прочее")
                      ? const OtherView()
                      : Container(),
    );
  }
}
