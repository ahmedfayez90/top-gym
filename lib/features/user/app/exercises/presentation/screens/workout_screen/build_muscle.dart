import '../../../../../../../core/config/routes/app.dart';

class BuildMuscle extends StatelessWidget {
  const BuildMuscle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(10.sp),
          child: Image.asset(AppImages.inTheGym),
        ),
        SizedBox(height: 1.h),
        ClipRRect(
          borderRadius: BorderRadius.circular(10.sp),
          child: Image.asset(AppImages.atHome),
        ),


      ],
    );
  }
}
