import '../../../../../../../core/config/routes/app.dart';

class UserDetailsWidget extends StatelessWidget {
  const UserDetailsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileUserCubit, ProfileUserState>(
      builder: (context, state) {
        var cubit = ProfileUserCubit.get(context);
        return Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const ProfilePhoto(),
            SizedBox(width: 8.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  cubit.userName == '' ? 'Loading...' : cubit.userName,
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(fontSize: 17.sp, fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 0.5.h),
                Text(cubit.userEmail),
                SizedBox(height: 2.h),
                SizedBox(
                  height: 5.h,
                  width: 35.w,
                  child: MainButton(
                    onPressed: () {
                      Navigator.of(context, rootNavigator: true)
                          .pushNamed(Routes.profileUserDataScreen);
                    },
                    text: 'Edit Profile',
                    borderRadius: 8,
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
