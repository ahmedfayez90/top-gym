import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../features/admin/app/calender_users/presentation/model/to_screen.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.toScreen});

  final ToScreen toScreen;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => toScreen.screen),
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(right: 10),
        child: Container(
          height: 226,
          width: 195,
          decoration: BoxDecoration(
            color: const Color(0xFF232441),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "I am",
                  style: GoogleFonts.lato(
                    fontSize: 30,
                    color: const Color(0xFF40D876),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10.0),
                Text(
                  toScreen.title,
                  style: GoogleFonts.lato(
                    fontSize: 30,
                    color: const Color(0xFF40D876),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20.0),
                Text(
                  "I have never trained",
                  style: GoogleFonts.lato(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
