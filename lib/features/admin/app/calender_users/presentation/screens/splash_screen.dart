import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/config/routes/routes.dart';
import '../../../../../../core/config/theme/app_color.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../widgets/app_name_in_splash_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? fadingAnimation;

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
    fadingAnimation =
        Tween<double>(begin: .2, end: 1).animate(animationController!);
    animationController?.repeat(reverse: true);
    goNext() => Navigator.pushReplacementNamed(
          context,
          // Routes.welcomeScreen
          // Routes.typeScreen,
      Routes.landingScreen
        );
    Timer(
      const Duration(seconds: 2),
      () => goNext(),
    );
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.thredColor,
      body: Center(
        child: FadeTransition(
          opacity: fadingAnimation!,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(flex: 1),
              SizedBox(height: 2.h),
              SizedBox(width: 100.w, child: Image.asset(AppImages.logo)),
              SizedBox(height: 2.h),
              const AppNameInSplashScreen(),
              const Spacer(flex: 2),
              const CircularProgressIndicator(color: AppColor.primaryColor),
              SizedBox(height: 2.h),
              const Text(AppStrings.loading,
                  style: TextStyle(color: Colors.white)),
              SizedBox(height: 5.h),
            ],
          ),
        ),
      ),
    );
  }
}
