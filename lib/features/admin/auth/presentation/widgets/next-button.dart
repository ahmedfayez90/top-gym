import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../../../core/component/main_button.dart';

class NextButton extends StatelessWidget {
  const NextButton({Key? key,required this.text,required this.onPresses}) : super(key: key);
final String text;
final VoidCallback onPresses;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: SizedBox(
        width: 25.w,
        child: MainButton(
          borderRadius: 4,
          onPressed: onPresses,
          text: text,
        ),
      ),
    );
  }
}
