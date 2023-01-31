import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/bloc/bloc/phone_auth/phone_auth_bloc.dart';
import '../widgets/build_pin_code_fields.dart';
import '../widgets/next-button.dart';

class OtpWidget extends StatelessWidget {
  OtpWidget(
      {Key? key, required this.codeController, required this.verificationId})
      : super(key: key);
  final TextEditingController codeController;
  final String verificationId;
  final GlobalKey<FormState> _otpFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhoneAuthBloc, PhoneAuthState>(
      builder: (ctx, state) {
        PhoneAuthBloc bloc = PhoneAuthBloc.get(context);
        return Form(
          key: _otpFormKey,
          child: Column(
            children: [
              BuildPinCodeField(
                onChanged: (value) {
                  codeController.text = value;
                  log(value);
                },
                onCompleted: (submitCode) {
                  codeController.text = submitCode;
                  log("Completed");
                },
              ),
              const SizedBox(height: 30),
              NextButton(
                text: 'verify',
                onPresses: () {
                  if (_otpFormKey.currentState!.validate()) {
                    bloc.add(VerifySentOtpEvent(
                        otpCode: codeController.text,
                        verificationId: verificationId));
                    codeController.clear();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
