import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vtb_hackathon/consts/vtb_colors.dart';
import 'package:vtb_hackathon/data/player/player.dart';

class AcievmentsView extends StatelessWidget {
  const AcievmentsView({Key? key}) : super(key: key);

  Widget buildList(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.zero,
      itemCount: Provider.of<Player>(context).achievments.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Container(
          //height: 50,
          constraints: const BoxConstraints(minHeight: 50),
          width: MediaQuery.of(context).size.width - 30,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(10)),
            color: VTBColors.color5,
          ),
          child: Padding(
            padding:
                const EdgeInsets.only(left: 15, top: 8, bottom: 8, right: 60),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  Provider.of<Player>(context).achievments[index].title,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  Provider.of<Player>(context).achievments[index].description,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Заголовок
          Padding(
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).padding.top + 27,
              left: 15,
              right: 15,
              bottom: 0,
            ),
            child: Row(
              children: const [
                Text(
                  'Достижения',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: VTBColors.color5,
                  ),
                ),
              ],
            ),
          ),

          SafeArea(
            child: SizedBox(
              height: MediaQuery.of(context).size.height -
                  (MediaQuery.of(context).padding.top) -
                  79,
              child: buildList(context),
            ),
          ),
        ],
      ),
    );
  }
}

class Achievment {
  String title;
  String description;

  Achievment(
    this.title,
    this.description,
  );
}
