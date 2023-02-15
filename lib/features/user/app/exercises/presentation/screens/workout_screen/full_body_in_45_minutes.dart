import '../../../../../../../core/config/routes/app.dart';

class FullBodyIn45Minutes extends StatelessWidget {
  const FullBodyIn45Minutes({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.sp),
          child: Image.asset(AppImages.inTheGym),
        ),
      ],
    );
  }
}
