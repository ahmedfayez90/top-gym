import '../../../../../../../core/config/routes/app.dart';

class ThemeCheck extends StatelessWidget {
  const ThemeCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileUserCubit, ProfileUserState>(
      builder: (context, state) {
        ProfileUserCubit cubit = ProfileUserCubit.get(context);
        return ListTileItem(
          isCheck: true,
          title: AppLocalizations.of(context)!.translate(AppStrings.darkMode)!,
          icon: Icons.dark_mode,
          switchValue: cubit.isCheck,
          onChanged: cubit.changeAppCheck,
        );
      },
    );
  }
}
