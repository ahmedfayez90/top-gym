
import '../../../../../../../core/config/routes/app.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTileItem(
      onTap: () async {
        FirebaseAuth.instance.signOut().then(
              (value) => Navigator.of(context, rootNavigator: true)
              .pushReplacementNamed(
            Routes.typeScreen,
            // (route) => false,
          ),
        );
      },
      icon: Icons.logout,
      title: AppLocalizations.of(context)!.translate(AppStrings.signOut)!,
    );
  }
}
