import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/utils/app_images.dart';
import '../../../features/admin/app/calender_users/presentation/widgets/app_name_in_splash_screen.dart';
// ignore: must_be_immutable
class AppBarNameAndImage extends StatelessWidget {
  AppBarNameAndImage({super.key, required this.child});
  Widget child;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const AppNameInSplashScreen(),

          Container(
            height: 9.h,
            width: 20.w,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage(AppImages.noPerson),
              ),
            ),
            child: ClipOval(child: child),
          ),

        ],
      ),
    );
  }
}
