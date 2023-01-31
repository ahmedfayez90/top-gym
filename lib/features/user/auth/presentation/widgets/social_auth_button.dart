import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/component/main_button.dart';
import '../../../../../core/config/theme/app_color.dart';


class SocialAuthButton extends StatelessWidget {
  const SocialAuthButton({
    Key? key,
    required this.onPressed,
    required this.image,
    required this.text,
  }) : super(key: key);
  final VoidCallback onPressed;
  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return MainButton(
      onPressed: onPressed,
      colorButton: AppColor.noColor,
      isBorderSide: true,
      text: text,
      borderRadius: 50,
      iconOrImageButtonWidget: Padding(
        padding: EdgeInsets.only(right: 2.w),
        child: Image.asset(
          image,
          height: 2.5.h,
        ),
      ),
    );
  }
}
