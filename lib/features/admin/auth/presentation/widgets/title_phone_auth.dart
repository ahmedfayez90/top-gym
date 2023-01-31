import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/utils/app_strings.dart';

class TitlePhoneAuth extends StatelessWidget {
  const TitlePhoneAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
         AppStringsOfAuthAdmin.whatPhone ,
          style: Theme.of(context)
              .textTheme
              .headline1!
              .copyWith(fontSize: 21.sp),
        ),
        SizedBox(height: 2.h),
        Text(
        AppStringsOfAuthAdmin.pleaseEnterPhone  ,
          style: Theme.of(context).textTheme.headline1!.copyWith(
            fontSize: 15.sp,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }
}
