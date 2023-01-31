import 'package:flutter/cupertino.dart';

import '../screens/beginner.dart';
import '../screens/inavtive.dart';

class ToScreen {
final Widget screen;
final String title;

  ToScreen({required this.title, required  this.screen});
static List<ToScreen> detalis = [
    ToScreen(
      title: 'Beginner',
      screen: const Beginner(),
    ),
    ToScreen(
      title: 'inactive',
      screen: const Inavtive(),
    ),
  ];
}