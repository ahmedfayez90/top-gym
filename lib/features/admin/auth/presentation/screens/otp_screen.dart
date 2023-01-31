import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../../core/component/toast.dart';
import '../../../../../core/config/routes/routes.dart';
import '../../../../../core/config/theme/app_color.dart';
import '../../logic/cubit/login_admin/login_admin_cubit.dart';
import '../widgets/build_pin_code_fields.dart';
import '../widgets/next-button.dart';
import '../widgets/title_otp_screen.dart';

class OtpScreen extends StatelessWidget {
  OtpScreen({Key? key, required this.phoneNumber}) : super(key: key);
  final  phoneNumber;
  late String otpCode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(7.w),
        child: BlocListener<LoginAdminCubit, LoginAdminState>(
          listenWhen: (previous, current) {
            return previous != current;
          },
          listener: (context, state) {
            if (state is LoadingLoginAdminState) {
              const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is PhoneOtpVerifiedAdminState) {
              Navigator.pushReplacementNamed(context, Routes.welcomeScreen);
            }
            if (state is ErrorLoginAdminState) {
              String errorMsg = (state).error;
              flutterToast(msg: errorMsg, color: AppColor.primaryColor);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 5.h),
              TitleOtpScreen(phoneNumber: phoneNumber),
              SizedBox(height: 7.h),
              BuildPinCodeField(
                onChanged: (value) {
                  otpCode = value;
                  log(value);
                },
                onCompleted: (submitCode) {
                  otpCode = submitCode;
                  log("Completed");
                },
              ),
              SizedBox(height: 15.h),
              NextButton(
                text: 'verify',
                onPresses: () {
                  BlocProvider.of<LoginAdminCubit>(context).submitOtp(otpCode);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
