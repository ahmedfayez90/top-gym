import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sizer/sizer.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 90.w,
      child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "TOP ",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 50,
                      color: Colors.white,
                      letterSpacing: 1.8,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Text(
                      "GYM",
                      style: GoogleFonts.bebasNeue(
                        fontSize: 50, //Color(0xFF40D876),
                        color: const Color.fromARGB(255, 225, 235, 94),
                        letterSpacing: 1.8,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(top: 0, left: 60),
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/ka.jpg"),
                      radius: 35,
                    ),
                  ),
                ],
              ),
    );
           
  }
}