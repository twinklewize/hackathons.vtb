import 'package:flutter/material.dart';
import 'package:vtb_hackathon/onboarding/auth/auth_form.dart';

// ignore: use_key_in_widget_constructors
class AuthFormScreen extends StatelessWidget {
  static const routeName = '/onboarding/auth_form_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 200,
              height: 200,
              margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
              child: Image.asset("assets/images/logo.png"),
            ),
          ),
          AuthForm(),
        ],
      ),
    );
  }
}
