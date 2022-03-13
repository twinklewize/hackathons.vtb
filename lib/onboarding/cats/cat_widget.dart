import 'dart:async';

import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class CatWidget extends StatefulWidget {
  final String _text;
  bool isGood;
  final Function onTap;

  // ignore: use_key_in_widget_constructors
  CatWidget(this._text, {required this.isGood, required this.onTap});

  @override
  State<CatWidget> createState() => _CatWidgetState();
}

class _CatWidgetState extends State<CatWidget>
    with SingleTickerProviderStateMixin {
  bool selected = false;

  late AnimationController controller;
  late Animation sizeAnimation;
  late Animation opacityAnimation;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    sizeAnimation = Tween<double>(begin: 0.0, end: 300.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.fastOutSlowIn,
      ),
    );

    opacityAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: controller,
        curve: Curves.fastOutSlowIn,
      ),
    );

    // Rebuilding the screen when animation goes ahead
    controller.addListener(() {
      setState(() {});
    });

    controller.forward();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        setState(() {
          if (sizeAnimation.value == 0.0) {
            controller.forward().whenComplete(() => widget.onTap());
          } else {
            controller.reverse().whenComplete(() {
              widget.onTap();
              controller.forward();
            });
          }
        });
      },
      child: Stack(
        children: [
          Align(
            alignment:
                widget.isGood ? Alignment.bottomLeft : Alignment.bottomRight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // ignore: sized_box_for_whitespace
                Opacity(
                  opacity: opacityAnimation.value,
                  child: Container(
                    width: 300,
                    child: Card(
                      margin: const EdgeInsets.all(15),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 30, horizontal: 15),
                        child: Text(widget._text),
                      ),
                    ),
                  ),
                ),
                // ignore: sized_box_for_whitespace
                Container(
                  width: sizeAnimation.value,
                  height: sizeAnimation.value,
                  margin:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: widget.isGood
                      ? Image.asset("assets/images/good_cat.png")
                      : Image.asset("assets/images/bad_cat.png"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
