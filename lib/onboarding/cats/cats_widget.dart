import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vtb_hackathon/onboarding/cats/cat_phrases_model.dart';

import 'cat_widget.dart';

// ignore: use_key_in_widget_constructors
class CatsWidget extends StatefulWidget {
  Widget child;
  CatsWidget({required this.child});

  @override
  State<CatsWidget> createState() => _CatsWidgetState();
}

class _CatsWidgetState extends State<CatsWidget> {
  bool _isInit = true;
  late final catPhrases;
  late final userData;
  late List<String> phrases;
  late bool noCats;
  late bool isGood;
  late int index = 0;

  void onTap() {
    if (index < phrases.length - 1) {
      print(index);
      index++;
      isGood = !isGood;
    } else {
      catPhrases.setNoCats(true);
      index = 0;
    }

    setState(() {});
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      catPhrases = Provider.of<CatPhrasesModel>(
        context,
        listen: true,
      );
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    noCats = catPhrases.noCats;
    phrases = catPhrases.phrases;
    if (index == 0) isGood = catPhrases.firstCatIsGood;
    return noCats
        ? widget.child
        : Stack(
            children: [
              widget.child,
              Container(
                height: double.infinity,
                width: double.infinity,
                color: Colors.black12,
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: CatWidget(
                  phrases[index],
                  isGood: isGood,
                  onTap: onTap,
                ),
              )
            ],
          );
  }
}


// Container(
          //   height: double.infinity,
          //   width: double.infinity,
          //   color: Colors.black26,
          // ),
          // BackdropFilter(
          //   filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          //   child: CatWidget('Привет, ${userData.userName}, мой дорогой друг! ',
          //       isGood: false),
          // )