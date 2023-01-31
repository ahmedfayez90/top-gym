import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../core/config/theme/app_color.dart';
import 'card_tack_image.dart';

// ignore: must_be_immutable
class ShowModelBottomSheet extends StatelessWidget {
  ShowModelBottomSheet({
    super.key,
    required this.galleryFunction,
    required this.cameraFunction,
  });
  VoidCallback galleryFunction;
  VoidCallback cameraFunction;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.wColor,
        borderRadius: BorderRadius.circular(15.sp),
      ),
      padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
      child: Wrap(
        children: [
          CardTackImage(
            name: 'Browse Gallery',
            icon: Icons.add_photo_alternate_rounded,
            onPressed: galleryFunction,
          ),
          const Align(
            alignment: Alignment.center,
            child: Text('OR'),
          ),
          CardTackImage(
            name: 'Use a Camera',
            icon: Icons.camera,
            onPressed: cameraFunction,
          ),
        ],
      ),
    );
  }
}
