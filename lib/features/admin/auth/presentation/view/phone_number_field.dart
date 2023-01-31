import 'package:country_picker/country_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/config/theme/app_color.dart';
import '../../logic/bloc/bloc/phone_auth/phone_auth_bloc.dart';
import '../widgets/next-button.dart';

class PhoneNumberWidget extends StatefulWidget {
  const PhoneNumberWidget({Key? key, required this.phoneNumberController})
      : super(key: key);
  final TextEditingController phoneNumberController;

  @override
  State<PhoneNumberWidget> createState() => _PhoneNumberWidgetState();
}

class _PhoneNumberWidgetState extends State<PhoneNumberWidget> {
  Country selectedCountry = Country(
    phoneCode: '20',
    countryCode: "EG",
    e164Sc: 0,
    geographic: true,
    level: 1,
    name: "Egypt",
    example: "Egypt",
    displayName: "Egypt",
    displayNameNoCountryCode: "EG",
    e164Key: "e164Key",
  );

  final GlobalKey<FormState> _phoneNumberFormKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _phoneNumberFormKey,
      child: Column(
        children: [
          TextFormField(
            autofocus: true,
            keyboardType: TextInputType.phone,
            controller: widget.phoneNumberController,
            style: TextStyle(
              color: AppColor.wColor,
              fontSize: 15.sp,
              letterSpacing: 2,
            ),
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              hintText: "Enter Phone Number",
              hintStyle: TextStyle(
                color: AppColor.backGroundListGenerate,
                fontSize: 12.sp,
              ),
              prefixIcon: Container(
                padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                child: InkWell(
                  onTap: () {
                    showCountryPicker(
                      context: context,
                      countryListTheme:
                          CountryListThemeData(bottomSheetHeight: 70.h),
                      onSelect: (value) {
                        setState(() {
                          selectedCountry = value;
                        });
                      },
                    );
                  },
                  child: Text(
                    "${selectedCountry.flagEmoji} +${selectedCountry.phoneCode}",
                    style: TextStyle(fontSize: 17.sp, color: AppColor.wColor),
                  ),
                ),
              ),
              suffixIcon: widget.phoneNumberController.text.length == 10
                  ? Icon(
                      CupertinoIcons.check_mark_circled_solid,
                      size: 25.sp,
                      color: AppColor.wColor,
                    )
                  : null,
            ),
            autovalidateMode: AutovalidateMode.onUserInteraction,
            // onChanged: (val){
            //   widget.phoneNumberController.text = val;
            // },
            validator: (value) {
              if (value!.length != 10) {
                return 'valid phone number as 10 **** ***';
              }
              return null;
            },
          ),
          SizedBox(height: 3.h),
          NextButton(
            text: 'Next',
            onPresses: () {
              if (_phoneNumberFormKey.currentState!.validate()) {
                final phoneNumberWithCode =
                    "+${selectedCountry.phoneCode}${widget.phoneNumberController.text}";
                context
                    .read<PhoneAuthBloc>()
                    .add(SendOtpToPhoneEvent(phoneNumber: phoneNumberWithCode));
                widget.phoneNumberController.clear();

                // _sendOtp(
                //     phoneNumber: widget.phoneNumberController.text,
                //     context: context);
              }
            },
          ),
        ],
      ),
    );
  }

  // void _sendOtp({required String phoneNumber, required BuildContext context}) {
  //   final phoneNumberWithCode = "+${selectedCountry.phoneCode}$phoneNumber";
  //   context.read<PhoneAuthBloc>().add(
  //         SendOtpToPhoneEvent(
  //           phoneNumber: phoneNumberWithCode,
  //         ),
  //       );
  //   widget.phoneNumberController.clear();
  // }
}
