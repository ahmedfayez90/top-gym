import '../../../../../../../core/config/routes/app.dart';

class LanguageCheck extends StatelessWidget {
  const LanguageCheck({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileUserCubit, ProfileUserState>(
      builder: (context, state) {
        ProfileUserCubit cubit = ProfileUserCubit.get(context);
        return ListTileItem(
          isCheck: true,
          title: AppLocalizations.of(context)!.translate(AppStrings.langKey)!,
          icon: Icons.language_sharp,
          switchValue: cubit.lang,
          onChanged: cubit.onChangeValue,
        );
      },
    );
  }
}
