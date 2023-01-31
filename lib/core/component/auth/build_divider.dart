
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../config/theme/app_color.dart';

class BuildDivider extends StatelessWidget {
  const BuildDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: EdgeInsets.only(right: 1.w),
            height: 1,
            color: AppColor.wColor,
          ),
        ),
        Text(
          ' or continue with ',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        Expanded(
          child: Container(
            margin: EdgeInsets.only(left: 1.w),
            height: 1,
            color: AppColor.wColor,
          ),
        ),
      ],
    );
  }
}
