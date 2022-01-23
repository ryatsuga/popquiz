import 'package:flutter/material.dart';
import 'package:popquiz/shared/themes/app_colors.dart';
import 'package:popquiz/shared/themes/app_images.dart';
import 'package:popquiz/shared/themes/app_text_styles.dart';

class StartButton extends StatelessWidget {
  final VoidCallback onTap;
  const StartButton({Key? key, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          height: 56,
          decoration: BoxDecoration(
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(5),
              border: const Border.fromBorderSide(
                  BorderSide(color: AppColors.stroke))),
          child: Row(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Responder Quizzes!",
                      style: TextStyles.buttonBoldBackground,
                    )
                  ],
                ),
              ),
            ],
          )),
    );
  }
}
