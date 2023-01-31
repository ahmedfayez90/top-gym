import '../../../../../../core/config/routes/app.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(color: AppColor.primaryColor),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w),
        child: Stack(
          children: [
            const LogOutButton(),
            Positioned(
              bottom: 0,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                decoration: BoxDecoration(
                  color: AppColor.profileBackgroundColor,
                  borderRadius: BorderRadius.circular(15.sp),
                ),
                height: 75.h,
                width: 90.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ListTileItem(),
                    SizedBox(height: 2.h),
                  ],
                ),
              ),
            ),
            // ProfilePhoto(imageUser: "${cubit.currentUser().photoURL}"),
          ],
        ),
      ),
    );
  }
}

// Text(
//   cubit.currentUser().displayName ?? "noName",
//   style: const TextStyle(
//       fontSize: 15, color: AppColor.bColor),
// ),
// Text(
//   time,
//   style: const TextStyle(
//       fontSize: 15, color: AppColor.bColor),
// )
// ,

// Text(
//   "${cubit.currentUser().email}",
//   style: const TextStyle(
//       fontSize: 20, color: AppColor.bColor),
// ),

// BlocBuilder<ProfileUserCubit, ProfileUserState>(
// builder: (context, state) {
// ProfileUserCubit cubit = ProfileUserCubit.get(context);
// cubit.checkFingerPrint();
// return Switch(
// activeColor: AppColor.primaryColor,
// value: cubit.isSwitchChecked,
// onChanged: (value) async {
// print("***************************************************");
// print(value);
// print(cubit.isSwitchChecked);
// if (await cubit.authFingerPrint()) {
// cubit.enableFingerPrint(value);
// if (value) {
// ScaffoldMessenger.of(context).showSnackBar(
// SnackBar(
// content: Text(
// "Enable Finger Print",
// style: TextStyle(
// fontSize: 22.sp,
// ),
// ),
// ),
// );
// }
// }
// },
// );
// },
// ),
