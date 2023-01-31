import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/config/theme/app_color.dart';
import '../../../../../core/utils/app_strings.dart';

class TitleOtpScreen extends StatelessWidget {
   const TitleOtpScreen({Key? key,required this.phoneNumber}) : super(key: key);
 final phoneNumber ;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStringsOfAuthAdmin.verifyPhone,
          style:
              Theme.of(context).textTheme.headline1!.copyWith(fontSize: 21.sp),
        ),
        SizedBox(height: 2.h),
        RichText(
          text: TextSpan(
            text: AppStringsOfAuthAdmin.enterYour6Digit,
            style:const TextStyle(
              color: AppColor.wColor,
              fontSize: 18,
              height: 1.4,
            ),
            children: [
              TextSpan(text: phoneNumber,style: const TextStyle(color: AppColor.primaryColor))
            ]
          ),
        ),
      ],
    );
  }
}
