import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import '../../../../../core/config/theme/app_color.dart';

class BuildPinCodeField extends StatelessWidget {
  const BuildPinCodeField({
    Key? key,
    required this.onCompleted,
    required this.onChanged,
  }) : super(key: key);

  final void Function(String)? onCompleted;
  final void Function(String) onChanged;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      length: 6,
      autoFocus: true,
      cursorColor: AppColor.bColor,
      keyboardType: TextInputType.phone,
      obscureText: false,
      animationType: AnimationType.scale,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(5),
        fieldHeight: 50,
        borderWidth: 1,
        fieldWidth: 40,
        activeColor: AppColor.primaryColor,
        activeFillColor: Colors.white,
        inactiveColor: AppColor.wColor,
        errorBorderColor: Colors.redAccent,
        selectedColor: AppColor.primaryColor,
        selectedFillColor: AppColor.primaryColor,
        inactiveFillColor: AppColor.wColor,
        disabledColor: AppColor.wColor,
      ),
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: true,
      onCompleted: onCompleted,
      onChanged: onChanged,
      appContext: context,

    );
  }
}
