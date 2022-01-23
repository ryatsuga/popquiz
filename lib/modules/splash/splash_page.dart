import 'package:flutter/material.dart';
import 'package:popquiz/modules/splash/splash_controller.dart';
import 'package:popquiz/shared/themes/app_colors.dart';
import 'package:popquiz/shared/themes/app_images.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = SplashController();

    controller.pageTransition(context);

    return Scaffold(
        backgroundColor: AppColors.background,
        body: Center(
            child: Image.asset(
          AppImages.logo,
          width: 200,
        )));
  }
}
