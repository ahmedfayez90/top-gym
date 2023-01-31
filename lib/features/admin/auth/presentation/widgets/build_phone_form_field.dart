import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/component/text_form_field_widget.dart';
import '../../../../../core/config/theme/app_color.dart';

class BuildPhoneFormField extends StatefulWidget {
  const BuildPhoneFormField({
    Key? key,
    this.onChanged,
    required this.validator,
    this.suffixIcon,
    required this.textController,
  }) : super(key: key);

  final void Function(String)? onChanged;
  final String? Function(String?) validator;
  final Widget? suffixIcon;
  final TextEditingController textController;

  @override
  State<BuildPhoneFormField> createState() => _BuildPhoneFormFieldState();
}

class _BuildPhoneFormFieldState extends State<BuildPhoneFormField> {
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

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 3,
          child: TextFormFieldWidget(
            autoValidateMode: true,
            hintText: "Enter Phone Number",
            letterSpacing: 2,
            topHeightTextFormField: 0,
            autofocus: true,
            keyboardType: TextInputType.phone,
            text: "Phone",
            validator: widget.validator,
            onChanged: widget.onChanged,
            isSuffixOthers: true,
            suffixIcon: widget.suffixIcon,
            controller: widget.textController,
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
          ),
        ),
      ],
    );
  }
}
