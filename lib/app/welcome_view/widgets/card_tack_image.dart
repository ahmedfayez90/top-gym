import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../core/config/theme/app_color.dart';

class CardTackImage extends StatelessWidget {
  CardTackImage({super.key, required this.name, required this.icon,required this.onPressed});
  String name;
  IconData icon;
  VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(vertical: 1.h),
      child: ElevatedButton.icon(
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(10),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25.sp))),
          padding: MaterialStateProperty.all(
            EdgeInsets.symmetric(vertical: 2.h, horizontal: 25.w),
          ),
          backgroundColor: MaterialStateProperty.all(AppColor.wColor),
        ),
        onPressed:onPressed,
        icon: Icon(
          icon,
          color: AppColor.bColor,
        ),
        label: Text(
          name,
          style: TextStyle(
            fontSize: 13.sp,
            fontWeight: FontWeight.bold,
            color: AppColor.bColor,
          ),
        ),
      ),
    );
  }
}
