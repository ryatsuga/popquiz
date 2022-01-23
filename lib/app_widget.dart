import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:popquiz/modules/home/home_page.dart';
import 'package:popquiz/modules/landing/landing_page.dart';
import 'package:popquiz/modules/quiz/quiz_page.dart';
import 'package:popquiz/modules/splash/splash_page.dart';
import 'shared/themes/app_colors.dart';

class AppWidget extends StatelessWidget {
  AppWidget() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'POP Quiz',
        theme: ThemeData(
            primaryColor: AppColors.primary, primarySwatch: Colors.indigo),
        home: LandingPage(),
        initialRoute: "/home",
        routes: {
          "/splash": (context) => SplashPage(),
          "/home": (context) => HomePage(),
          "/landing": (context) => LandingPage(),
          "/quiz": (context) => QuizPage(),
        });
  }
}
