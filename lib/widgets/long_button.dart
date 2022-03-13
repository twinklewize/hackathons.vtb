import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LongButton extends StatelessWidget {
  LongButton(this.fillColor, this.isButtonEnable, this.title, {Key? key})
      : super(key: key);

  Color fillColor;
  Widget title;
  bool isButtonEnable;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 30,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        color: isButtonEnable ? fillColor : fillColor.withOpacity(0.5),
      ),
      child: Center(
        child: title,
      ),
    );
  }
}
