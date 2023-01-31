import 'package:flutter/material.dart';

import '../utils/app_images.dart';

class BGAppAdmin extends StatelessWidget {
  const BGAppAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage(
              AppImages.bgImageApp,
            ),
            fit: BoxFit.fill),
      ),
    );
  }
}
