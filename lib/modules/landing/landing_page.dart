import 'package:flutter/material.dart';
import 'package:popquiz/shared/themes/app_colors.dart';
import 'package:popquiz/shared/themes/app_images.dart';
import 'package:popquiz/shared/widgets/start_button/start_button.dart';

import '../../shared/themes/app_text_styles.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: AppColors.background,
        body: Container(
          width: size.width,
          height: size.height,
          child: Stack(children: [
            Container(
              width: size.width,
              height: size.height * 0.36,
              color: AppColors.primary,
            ),
            Positioned(
              child: Image.asset(
                AppImages.logoInCircleWhite,
                height: 300,
              ),
              left: 0,
              right: 0,
              top: 100,
            ),
            Positioned(
              bottom: size.height * 0.10,
              left: 0,
              right: 0,
              child: Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 25, left: 40, right: 40),
                    child: Text(
                      "Tá pronto para responder os quizzes mais pops do momento?",
                      style: TextStyles.titleHome,
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 30, left: 40, right: 40),
                    child: Column(
                      children: [
                        SizedBox(height: size.height * 0.06),
                        StartButton(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/home');
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ]),
        ));
  }
}
