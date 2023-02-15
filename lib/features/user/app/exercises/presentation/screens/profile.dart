import '../../../../../../core/config/routes/app.dart';

class Profile extends StatelessWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 1.h),
            const UserDetailsWidget(),
            SizedBox(height: 1.h),
            const Divider(thickness: 3),
            Text(
              AppLocalizations.of(context)!.translate(AppStrings.general)!,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(height: 3.h),
            const LanguageCheck(),
            SizedBox(height: 1.h),
            const ThemeCheck(),
            SizedBox(height: 1.h),
            const LogOutButton(),
          ],
        ));
  }
}
