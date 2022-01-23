import 'package:flutter/material.dart';
import 'package:popquiz/shared/themes/app_colors.dart';
import 'package:popquiz/shared/themes/app_text_styles.dart';
import 'package:popquiz/shared/widgets/divider_vertical/divider_vertical_widget.dart';

import '../label_button/label_button.dart';

class SetLabelButtons extends StatelessWidget {
  final String primaryLabel;
  final VoidCallback primaryOnPressed;
  final String secondaryLabel;
  final VoidCallback secondaryOnPressed;
  final bool enableSecondaryColor;
  final bool enableSecandaryDangerColor;

  const SetLabelButtons(
      {Key? key,
      required this.primaryLabel,
      required this.primaryOnPressed,
      required this.secondaryLabel,
      required this.secondaryOnPressed,
      this.enableSecondaryColor = false,
      this.enableSecandaryDangerColor = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      height: 56,
      child: Row(
        children: [
          Expanded(
            child: LabelButton(
              label: primaryLabel,
              onPressed: primaryOnPressed,
            ),
          ),
          DividerVerticalWidget(),
          Expanded(
            child: LabelButton(
              label: secondaryLabel,
              onPressed: secondaryOnPressed,
              style: enableSecandaryDangerColor
                  ? TextStyles.buttonBoldDanger
                  : enableSecondaryColor
                      ? TextStyles.buttonBoldPrimary
                      : null,
            ),
          ),
        ],
      ),
    );
  }
}
