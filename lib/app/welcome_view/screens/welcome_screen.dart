import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../core/config/routes/routes.dart';
import '../../../core/utils/app_images.dart';
import '../../../features/admin/auth/logic/cubit/login_admin/login_admin_cubit.dart';
import '../view/down_screen_down.dart';
import '../view/down_screen_up.dart';
import '../view/head_screen.dart';
import '../view/middle_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImages.bgImageApp),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 2.h),
            BlocBuilder<LoginAdminCubit, LoginAdminState>(
              builder: (context, state) {
                LoginAdminCubit cubit = LoginAdminCubit.get(context);
                return IconButton(
                  onPressed: () {
                    cubit.logout();
                    Navigator.pushReplacementNamed(context, Routes.typeScreen);
                  },
                  icon: const Icon(Icons.logout),
                );
              },
            ),
            const HeadScreen(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const MiddleScreen(),
                  SizedBox(height: 3.h),
                  const DownScreenUo(),
                  SizedBox(height: 3.h),
                  const DownScreenDown(),
                  SizedBox(height: 3.h),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
