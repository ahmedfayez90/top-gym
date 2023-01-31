import 'package:flutter/material.dart';

import '../config/theme/app_color.dart';

class LoaderDialog {
  BuildContext context;

  LoaderDialog({required this.context});

  void showProgressIndicator() {
    AlertDialog alertDialog = AlertDialog(
      backgroundColor: AppColor.noColor,
      elevation: 0,
      content: const Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(AppColor.wColor),
        ),
      ),
    );

    showDialog(
      barrierColor: AppColor.wColor,
      barrierDismissible: false,
      context: context,
      builder: (context) => alertDialog,
    );
  }
}
