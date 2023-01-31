import '../../../../../../../core/config/routes/app.dart';

class ListTileItem extends StatelessWidget {
  const ListTileItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.sp),
          color: AppColor.profileItemColor),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 1.h),
            child: Icon(
              Icons.mode_night,
              size: 35.sp,
            ),
          ),
          Text(
            "Night Mode",
            style: TextStyle(fontSize: 17.sp),
          ),
        ],
      ),
    );
  }
}
