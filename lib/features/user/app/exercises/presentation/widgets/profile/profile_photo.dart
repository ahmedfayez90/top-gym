import '../../../../../../../core/config/routes/app.dart';

class ProfilePhoto extends StatelessWidget {
  const ProfilePhoto({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileUserCubit, ProfileUserState>(
        builder: (context, state) {
      var cubit = ProfileUserCubit.get(context);
      return SizedBox(
        child: cubit.userImg == ''
            ? CircleAvatar(
                radius: 60,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50.sp),
                  child: Image.asset(
                    AppImages.noPerson,
                    width: 30.w,
                    height: 14.h,
                    fit: BoxFit.fill,
                  ),
                ),
              )
            : ImageNetworkComponent(image: cubit.userImg),
      );
    });
  }
}
