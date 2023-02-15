import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sizer/sizer.dart';

flutterToast({
  required String msg,
  required Color color,
  Toast toastLength = Toast.LENGTH_SHORT,
}) {
  return Fluttertoast.showToast(
    msg: msg,
    toastLength: toastLength,
    gravity: ToastGravity.TOP,
    timeInSecForIosWeb: 1,
    backgroundColor: color,
    textColor: Colors.white,
    fontSize: 14.0.sp,
  );
}

flutterSnackBar({required BuildContext context, required String msg}) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text(msg)),
  );
}
