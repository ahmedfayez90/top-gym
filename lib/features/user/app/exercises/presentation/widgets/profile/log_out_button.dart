import '../../../../../../../core/config/routes/app.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 1.h,
      right: -4.w,
      child: IconButton(
        onPressed: () async {
          FirebaseAuth.instance.signOut().then(
                (value) => Navigator.of(context, rootNavigator: true)
                .pushReplacementNamed(
              Routes.typeScreen,
              // (route) => false,
            ),
          );
        },
        icon: Icon(
          Icons.assignment_return_outlined,
          color: AppColor.wColor,
          size: 25.sp,
        ),
      ),
    );
  }
}
