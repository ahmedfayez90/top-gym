import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:top_gym/core/config/routes/app.dart';
import '../../../../core/config/theme/app_color.dart';

class DownScreenDown extends StatelessWidget {
  const DownScreenDown({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Skip Intro",
          style: GoogleFonts.lato(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Colors.white30,
          ),
        ),
        GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              Routes.uploadScreen,
            );
          },
          child: Container(
            width: 139,
            height: 39,
            decoration: BoxDecoration(
              color: AppColor.primaryColor,
              borderRadius: BorderRadius.circular(5.0),
            ),
            child: Center(
              child: Text(
                "Next",
                style: GoogleFonts.lato(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
