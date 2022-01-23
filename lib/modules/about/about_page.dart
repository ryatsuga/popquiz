import 'package:flutter/material.dart';
import 'package:popquiz/shared/themes/app_colors.dart';
import 'package:popquiz/shared/themes/app_text_styles.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Icon(
              Icons.info_outline_rounded,
              color: AppColors.primary,
              size: 40,
            ),
          ),
          Text.rich(
            TextSpan(
                text: 'Projeto POP Quiz\n',
                style: TextStyles.captionBoldPrimary,
                children: [
                  TextSpan(
                    text: 'Desenvolvido por Leandro Passos',
                    style: TextStyles.captionGray,
                  )
                ]),
            textAlign: TextAlign.center,
          )
        ]),
      ),
    );
  }
}
