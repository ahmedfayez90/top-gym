import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/component/bg_app_admin.dart';
import '../../../../../core/component/main_button.dart';
import '../../../../../core/config/routes/routes.dart';
import '../../../../../core/config/theme/app_color.dart';

class AuthUser extends StatelessWidget {
  const AuthUser({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BGAppAdmin(),
        Scaffold(
          backgroundColor: AppColor.noColor,
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Spacer(
                    flex: 1,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Top Gym',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 35.sp),
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  MainButton(
                    colorButton: AppColor.backgroundColor,
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.signUpUserScreen);
                    },
                    text: 'Sign Up',
                    borderRadius: 50,
                  ),
                  SizedBox(height: 5.h),
                  MainButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.logInUserScreen);
                    },
                    text: 'Log In',
                    borderRadius: 50,
                    fontSizeText: 15,
                  ),
                  SizedBox(height: 5.h),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
