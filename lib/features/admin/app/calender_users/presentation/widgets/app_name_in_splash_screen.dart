import 'package:flutter/material.dart';

class AppNameInSplashScreen extends StatelessWidget {
  const AppNameInSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: "TOP ",
        style: Theme.of(context).textTheme.headline3,
        children: [
          TextSpan(
            text: "GYM",
            style: Theme.of(context).textTheme.headline4,
          )
        ],
      ),
    );
  }
}
