import '../../../../../../core/config/routes/app.dart';

class TypeScreen extends StatelessWidget {
  const TypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BGAppAdmin(),
        Scaffold(
          backgroundColor: AppColor.noColor,
          body: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const Spacer(flex: 1),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      'Top Gym',
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 35.sp),
                    ),
                  ),
                  const Spacer(flex: 1),
                  MainButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        // Routes.phoneAuthPage
                        Routes.authAdmin
                      );
                    },
                    text: 'Admin',
                    borderRadius: 50,
                  ),
                  SizedBox(height: 5.h),
                  MainButton(
                    colorButton: AppColor.backgroundColor,
                    onPressed: () {
                      Navigator.pushNamed(context, Routes.authUser);
                    },
                    text: 'User',
                    borderRadius: 50,
                    fontSizeText: 15,
                  ),
                  SizedBox(height: 5.h),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
