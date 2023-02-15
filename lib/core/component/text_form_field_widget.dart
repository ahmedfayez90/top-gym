import '../config/routes/app.dart';

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.text,
    this.isSuffixIconPassword = false,
    this.controller,
    this.obscureText = false,
    required this.validator,
    required this.onChanged,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.autofocus = false,
    this.onSaved,
    this.topHeightTextFormField = 2,
    this.letterSpacing = 0,
    this.hintText = "",
    this.prefixIcon,
    this.suffixIcon,
    this.isSuffixOthers = false,
    this.autoValidateMode = false,
    this.fillColor = Colors.black45,
  });

  final bool isSuffixOthers;
  final Color fillColor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool autofocus;
  final String text;
  final TextEditingController? controller;
  final bool obscureText;
  final bool isSuffixIconPassword;
  final int maxLines;
  final String? Function(String?) validator;
  final void Function(String)? onChanged;
  final void Function(String?)? onSaved;
  final TextInputType keyboardType;
  final int topHeightTextFormField;
  final double letterSpacing;
  final String hintText;
  final bool autoValidateMode;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: topHeightTextFormField.h),
        BlocBuilder<LoginUserCubit, LoginUserState>(
          builder: (context, state) {
            LoginUserCubit cubit = LoginUserCubit.get(context);
            return TextFormField(
              keyboardType: keyboardType,
              textInputAction: TextInputAction.next,
              style: TextStyle(
                  color: AppColor.wColor,
                  fontSize: 15.sp,
                  letterSpacing: letterSpacing),
              autofocus: autofocus,
              autovalidateMode:
                  autoValidateMode ? AutovalidateMode.onUserInteraction : null,
              validator: validator,
              onSaved: onSaved,
              onChanged: onChanged,
              maxLines: maxLines,
              obscureText: obscureText,
              controller: controller,
              // textAlign: TextAlign.center,
              cursorHeight: 2.5.h,
              obscuringCharacter: '*',
              decoration: InputDecoration(
                fillColor: fillColor,
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Colors.white38,
                  letterSpacing: 1,
                  fontSize: 14.5.sp,
                ),
                filled: true,
                alignLabelWithHint: false,
                prefixIcon: prefixIcon,
                suffixIcon: isSuffixIconPassword
                    ? IconButton(
                        hoverColor: AppColor.noColor,
                        highlightColor: AppColor.noColor,
                        splashColor: AppColor.noColor,
                        icon: Icon(
                          cubit.obscureText
                              ? Icons.visibility_off_outlined
                              : Icons.visibility_outlined,
                        ),
                        color: AppColor.backGroundListGenerate,
                        iconSize: 20.sp,
                        onPressed: () {
                          cubit.visibility();
                        },
                      )
                    : isSuffixOthers
                        ? suffixIcon
                        : const SizedBox.shrink(),
                labelText: text,
                labelStyle: TextStyle(color: AppColor.wColor.withOpacity(0.8)),
                floatingLabelStyle:
                    const TextStyle(color: AppColor.primaryColor),
              ),
            );
          },
        ),
      ],
    );
  }
}
