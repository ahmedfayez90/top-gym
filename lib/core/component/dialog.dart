import 'package:flutter/material.dart';


import '../config/theme/app_color.dart';

class MainDialog {
  final BuildContext context;
  final String title;
  final String content;
  final List<Map<String, void Function()?>>? actions;

  MainDialog({
    required this.context,
    required this.title,
    required this.content,
    this.actions,
  });

  showAlertDialog() {
    showDialog(
      context: context,
      barrierColor: Colors.black,
      builder: (_) => AlertDialog(
        backgroundColor: AppColor.backGroundListGenerate,
        title: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: AppColor.wColor),
        ),
        content: Text(
          content,
          style: Theme.of(context).textTheme.headline1!.copyWith(
                color: AppColor.textColor,
                fontWeight: FontWeight.normal,
              ),
        ),
        actions: (actions != null)
            ? actions!
                .map(
                  (action) => TextButton(
                    onPressed: action.values.first,
                    child: Text(action.keys.first),
                  ),
                )
                .toList()
            : [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('OK'),
                ),
              ],
      ),
    );
  }
}

