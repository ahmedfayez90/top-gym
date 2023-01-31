import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../../features/admin/app/calender_users/presentation/model/to_screen.dart';
import '../cart/card.dart';

class DownScreenUo extends StatelessWidget {
  const DownScreenUo({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 26.h,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: ToScreen.detalis.length,
        itemBuilder: (BuildContext context, index) {
          return CardItem(
            toScreen: ToScreen.detalis[index],
          );
        },
      ),
    );
  }
}
