import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:top_gym/core/utils/app_images.dart';

class ImageNetworkComponent extends StatelessWidget {
  const ImageNetworkComponent({Key? key, required this.image})
      : super(key: key);
  final String? image;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(50.sp),
      child: Image.network(
        fit: BoxFit.contain,

        image ?? AppNetworkImage.noPhoto,
        frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
          if (wasSynchronouslyLoaded) return child;
          return AnimatedOpacity(
            opacity: frame == null ? 0 : 1,
            duration: const Duration(seconds: 5),
            curve: Curves.easeOut,
            child: child,
          );
        },

        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                      loadingProgress.expectedTotalBytes!
                  : null,
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return const Text(
            '😢',
            style: TextStyle(fontSize: 40),
          );
        },
      ),
    );
  }
}
