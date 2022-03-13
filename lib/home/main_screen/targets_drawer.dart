import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vtb_hackathon/consts/vtb_colors.dart';
import 'package:vtb_hackathon/data/player/player.dart';
import 'package:vtb_hackathon/onboarding/end/end_screen.dart';
import 'package:vtb_hackathon/widgets/long_button.dart';

// ignore: use_key_in_widget_constructors
class TargetsDrawer extends StatelessWidget {
  Widget targetListTile(
    String title,
    double cost,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: const BoxDecoration(
            color: VTBColors.color5,
            borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),

              // Стоимость
              Row(
                children: [
                  Text(
                    Provider.of<Player>(context).freeMoney.toStringAsFixed(2) +
                        ' / ',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    cost.toStringAsFixed(2) + ' ₽',
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              Provider.of<Player>(context).freeMoney >= cost
                  ? Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) => EndScreen(),
                            ),
                          );
                        },
                        child: LongButton(
                            VTBColors.color7,
                            true,
                            const Text(
                              'Выполнить',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            )),
                      ),
                    )
                  : Container(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).padding.top,
            color: Theme.of(context).primaryColor,
          ),
          Container(
            color: VTBColors.color5,
            height: 120,
            width: double.infinity,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            child: const Text(
              'Ваши цели',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          targetListTile(
            Provider.of<Player>(context).target,
            Provider.of<Player>(context).targetCost,
            context,
          ),
        ],
      ),
    );
  }
}
