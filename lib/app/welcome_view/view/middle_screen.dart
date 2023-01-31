import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../core/utils/app_strings.dart';

class MiddleScreen extends StatelessWidget {
  const MiddleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppStrings.aboutYou,
          style: Theme.of(context).textTheme.headline5,
        ),
        SizedBox(height: 2.h),
        Text(
          AppStrings.description,
          style: Theme.of(context).textTheme.caption,
        ),
      ],
    );
  }
}
