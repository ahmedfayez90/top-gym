import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../core/component/image_network_component.dart';
import '../../../../../../../core/config/theme/app_color.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({Key? key,required this.imageUser}) : super(key: key);
final String imageUser;
  @override
  Widget build(BuildContext context) {
    return   Positioned(
      top: 9.h,
      right: 31.w,
      child: Stack(
        alignment: Alignment.bottomRight,
        children: [
          CircleAvatar(
            radius: 60,
            backgroundColor: AppColor.primaryColor,
            // backgroundImage:const AssetImage(AppImages.kareem),
            child: ImageNetworkComponent(
                image: imageUser),
          ),
          Container(
            padding: EdgeInsets.all(1.w),
            decoration: const BoxDecoration(
                color: AppColor.primaryColor,
                shape: BoxShape.circle),
            child: Icon(
              Icons.photo_camera,
              size: 20.sp,
              color: AppColor.wColor,
            ),
          ),
        ],
      ),
    );
  }
}
