import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/component/main_button.dart';
import '../../../../../core/config/routes/routes.dart';
import '../../../../../core/config/theme/app_color.dart';
import '../../../../../core/utils/app_images.dart';
import '../../../../../core/utils/app_strings.dart';
import '../widgets/social_auth_button.dart';

class SignUpUserScreen extends StatefulWidget {
  const SignUpUserScreen({Key? key}) : super(key: key);

  @override
  State<SignUpUserScreen> createState() => _SignUpUserScreenState();
}

class _SignUpUserScreenState extends State<SignUpUserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      backgroundColor: AppColor.backgroundColor,
      body: Padding(
        padding: EdgeInsets.all(8.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppStringsOfAuthUser.signUpWelcome,
              style: Theme.of(context).textTheme.headline1,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5.h),
            MainButton(
              onPressed: () {
                Navigator.pushNamed(context, Routes.goalScreen);
              },
              text: AppStringsOfAuthUser.buttonContinue,
              borderRadius: 50,
            ),
            SizedBox(height: 2.h),
            Text(
              AppStringsOfAuthUser.textOR,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: 14.sp),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 2.h),
            SocialAuthButton(
              onPressed: () {},
              image: AppImages.facebook,
              text: AppStringsOfAuthUser.continueWithFacebook,
            ),
            SizedBox(height: 2.h),
            Text(
              AppStringsOfAuthUser.textPermission,
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(color: Colors.grey),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
