import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vtb_hackathon/consts/vtb_colors.dart';
import 'package:vtb_hackathon/data/companies/companies.dart';
import 'package:vtb_hackathon/data/player/player.dart';
import 'package:vtb_hackathon/home/finance_screen/finance_item.dart';
import 'package:vtb_hackathon/home/main_screen/stonks_chart.dart';
import 'package:vtb_hackathon/widgets/long_button.dart';

// ignore: must_be_immutable
class FinanceItemView extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  FinanceItemView(this.stonk);

  FinanceItem stonk;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Заголовок
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).padding.top + 27,
                left: 15,
                right: 15,
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.chevron_left_sharp,
                    size: 32,
                    color: VTBColors.color5,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    stonk.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: VTBColors.color5,
                    ),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(right: 30, left: 15, top: 30),
            child: StonksChart(stonk.name),
          ),

          // Цена сейчас
          Padding(
            padding: const EdgeInsets.only(
              top: 30,
              left: 15,
              right: 15,
            ),
            child: Row(
              children: [
                const Text(
                  "Цена сейчас: ",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text(
                  Provider.of<Companies>(context, listen: false)
                      .companies
                      .firstWhere((comp) => comp.name == stonk.name)
                      .stonksData
                      .last
                      .open
                      .toStringAsFixed(
                          2), // stonks[index].nowAmount.toStringAsFixed(2) + " ₽",
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
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
          const SizedBox(height: 10),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: SingleChildScrollView(
              child: SizedBox(
                height: (MediaQuery.of(context).size.height -
                        MediaQuery.of(context).padding.top) /
                    5,
                child: Text(
                  Provider.of<Companies>(context, listen: false)
                      .companies
                      .firstWhere((comp) => comp.name == stonk.name)
                      .description,
                ),
              ),
            ),
          ),

          const Expanded(child: SizedBox()),

          // покупка акций
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [
                InkWell(
                  onTap: () {
                    Provider.of<Player>(context, listen: false).buyStonk(
                      stonk.name,
                      Provider.of<Companies>(context, listen: false)
                          .companies
                          .firstWhere((comp) => comp.name == stonk.name)
                          .stonksData
                          .last
                          .open,
                    );
                  },
                  child: LongButton(
                    VTBColors.color5,
                    true,
                    const Text(
                      'Купить',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }
}
