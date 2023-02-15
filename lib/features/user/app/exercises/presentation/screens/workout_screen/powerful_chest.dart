import '../../../../../../../core/config/routes/app.dart';

class PowerfulChest extends StatelessWidget {
  const PowerfulChest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.sp),
          child: Image.asset(AppImages.atHome),
        ),
        SizedBox(height: 1.h),
        ClipRRect(
          borderRadius: BorderRadius.circular(10.sp),
          child: Image.asset(AppImages.inTheGym),
        ),
      ],
    );
  }
}
