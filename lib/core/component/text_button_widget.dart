import 'package:flutter/material.dart';

import '../config/theme/app_color.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        text,
        style: const TextStyle(
          decoration: TextDecoration.underline,
          color: AppColor.primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
