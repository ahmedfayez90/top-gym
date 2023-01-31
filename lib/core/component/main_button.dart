import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../config/theme/app_color.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.paddingVertical = 1.5,
    this.colorButton = AppColor.primaryColor,
    this.borderRadius = 0,
    this.fontSizeText = 13,
    this.isBorderSide = false,
    this.iconOrImageButtonWidget,
    this.isQuestionMaterialColor = false,
    this.backgroundColorButtonByMaterial,
    this.colorSide = AppColor.primaryColor,
    this.isTextCenter = true,
    this.textColor = AppColor.wColor,
    this.minimumSize,
  });

  final bool isTextCenter;
  final Color textColor;
  final Color colorSide;
  final Color colorButton;
  final String text;
  final VoidCallback onPressed;
  final double paddingVertical;
  final double borderRadius;
  final double fontSizeText;
  final bool isBorderSide;
  final Widget? iconOrImageButtonWidget;
  final bool isQuestionMaterialColor;
  final MaterialStateProperty<Color?>? backgroundColorButtonByMaterial;
  final MaterialStateProperty<Size?>? minimumSize;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        minimumSize: minimumSize,
        side: isBorderSide
            ? MaterialStateProperty.all(
                BorderSide(color: colorSide, width: 0.3.h),
              )
            : null,
        elevation: MaterialStateProperty.all(0),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius.sp),
          ),
        ),
        padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(vertical: paddingVertical.h)),
        backgroundColor: isQuestionMaterialColor
            ? backgroundColorButtonByMaterial
            : MaterialStateProperty.all(colorButton),
      ),
      onPressed: onPressed,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: Row(
          mainAxisAlignment:
              isTextCenter ? MainAxisAlignment.center : MainAxisAlignment.start,
          children: [
            iconOrImageButtonWidget ?? const SizedBox.shrink(),
            Text(
              text,
              style: TextStyle(
                fontSize: fontSizeText.sp,
                color: textColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
