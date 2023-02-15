import '../../../../../../../core/config/routes/app.dart';

class TextFormModifyProfile extends StatelessWidget {
  const TextFormModifyProfile({
    Key? key,
    this.controller,
    this.onChanged,
    this
        .onEditingComplete,
    this.initialValue,
    required this.title,
  }) : super(key: key);
  final String title;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final void Function()? onEditingComplete;
  final String? initialValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 2.h),
      child: TextFormField(
        controller: controller,
        onChanged: onChanged,
        onEditingComplete: onEditingComplete,
        initialValue: initialValue,
        decoration: InputDecoration(
          labelStyle: TextStyle(color: Theme
              .of(context)
              .hoverColor),
          labelText: title,
          hintText: title,
          enabledBorder: outlineInputBorder(context),
          border: outlineInputBorder(context),
          focusedBorder: outlineInputBorder(context),
          disabledBorder: outlineInputBorder(context),
          errorBorder: outlineInputBorderError(context),
          focusedErrorBorder: outlineInputBorderError(context),
        ),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder(context) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.sp),
        borderSide: BorderSide(
          // color: AppColor.noColor,
          color: Theme
              .of(context)
              .hoverColor,
          width: 2,
        ),
      );

  OutlineInputBorder outlineInputBorderError(context) =>
      OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.sp),
        borderSide: BorderSide(
          // color: AppColor.redColor,
          color: Theme
              .of(context)
              .splashColor,
          width: 2,
        ),
      );
}
