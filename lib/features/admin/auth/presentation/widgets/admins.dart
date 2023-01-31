import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/component/image_network_component.dart';
import '../../../../../core/config/theme/app_color.dart';
import '../../../../../core/utils/app_images.dart';

class Admins extends StatelessWidget {
  const Admins({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          backgroundColor: AppColor.noColor,
          radius: 50,
          child: const ImageNetworkComponent(image: AppNetworkImage.coachAhmed),
        ),
        SizedBox(width: 10.w),
        CircleAvatar(
          backgroundColor: AppColor.noColor,
          radius: 50,
          child:
              const ImageNetworkComponent(image: AppNetworkImage.coachKareem),
        ),
      ],
    );
  }
}
