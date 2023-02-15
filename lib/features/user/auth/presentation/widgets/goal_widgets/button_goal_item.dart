import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../../core/component/main_button.dart';
import '../../../../../../core/config/theme/app_color.dart';

class ButtonGoalItem extends StatelessWidget {
  ButtonGoalItem({
    Key? key,
    required this.onPressed,
    required this.selectedColor,
    required this.text,
    this.borderRadius = 4,
  }) : super(key: key);
  VoidCallback onPressed;
  bool selectedColor;
  String text;
  double borderRadius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 1.h),
      child: MainButton(
        borderRadius: borderRadius,
        isTextCenter: false,
        colorButton: AppColor.backgroundColor,
        isBorderSide: true,
        colorSide: selectedColor
            ? AppColor.primaryColor
            : AppColor.backGroundListGenerate,
        textColor: selectedColor ? AppColor.primaryColor : AppColor.textColor,
        onPressed: onPressed,
        text: text,
      ),
    );
  }
}
