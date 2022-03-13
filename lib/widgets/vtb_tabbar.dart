import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:vtb_hackathon/consts/vtb_colors.dart';
import 'package:vtb_hackathon/home/home_view_model.dart';

// ignore: must_be_immutable
class Tabbar extends StatelessWidget {
  String currentPage = 'Главный';

  Tabbar(this.currentPage, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
        elevation: 30,
        child: Container(
          height: 60,
          color: Colors.white,
          //color: Colors.red,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              // Главный
              InkWell(
                onTap: () {
                  Provider.of<HomeViewModel>(context, listen: false)
                      .selectPage('Главный');
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: SvgPicture.asset(
                        'lib/assets/icons/home.svg',
                        color: currentPage == 'Главный'
                            ? VTBColors.color5
                            : Colors.grey,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Главный',
                      style: TextStyle(
                        color: currentPage == 'Главный'
                            ? VTBColors.color5
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              // Лента
              InkWell(
                onTap: () {
                  Provider.of<HomeViewModel>(context, listen: false)
                      .selectPage('Лента');
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: SvgPicture.asset(
                        'lib/assets/icons/flame.svg',
                        color: currentPage == 'Лента'
                            ? VTBColors.color5
                            : Colors.grey,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Лента',
                      style: TextStyle(
                        color: currentPage == 'Лента'
                            ? VTBColors.color5
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              // Биржа
              InkWell(
                onTap: () {
                  Provider.of<HomeViewModel>(context, listen: false)
                      .selectPage('Биржа');
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: SvgPicture.asset(
                        'lib/assets/icons/finance.svg',
                        color: currentPage == 'Биржа'
                            ? VTBColors.color5
                            : Colors.grey,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Биржа',
                      style: TextStyle(
                        color: currentPage == 'Биржа'
                            ? VTBColors.color5
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),

              // Прочее
              InkWell(
                onTap: () {
                  Provider.of<HomeViewModel>(context, listen: false)
                      .selectPage('Прочее');
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 24,
                      width: 24,
                      child: SvgPicture.asset(
                        'lib/assets/icons/other_horizontal.svg',
                        color: currentPage == 'Прочее'
                            ? VTBColors.color5
                            : Colors.grey,
                        fit: BoxFit.contain,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      'Прочее',
                      style: TextStyle(
                        color: currentPage == 'Прочее'
                            ? VTBColors.color5
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
