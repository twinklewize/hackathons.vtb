import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HalfLongButton extends StatelessWidget {
  HalfLongButton(this.fillColor, this.isButtonEnable, this.title, {Key? key})
      : super(key: key);

  Color fillColor;
  Widget title;
  bool isButtonEnable;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2 - 15 - 15 - 7.5,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: fillColor,
      ),
      child: Center(
        child: title,
      ),
    );
  }
}
