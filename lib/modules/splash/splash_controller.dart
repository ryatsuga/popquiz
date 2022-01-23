import 'package:flutter/material.dart';

class SplashController {
  Future<void> pageTransition(BuildContext context) async {
    await Future.delayed(Duration(seconds: 2));

    Navigator.pushReplacementNamed(context, '/landing');
    return;
  }
}
