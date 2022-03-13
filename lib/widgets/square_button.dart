import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SquareButton extends StatelessWidget {
  SquareButton(
      this.fillColor, this.isButtonEnable, this.title, this.titleTextColor,
      {Key? key})
      : super(key: key);

  Color fillColor;
  Color titleTextColor;
  Widget title;
  bool isButtonEnable;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
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
