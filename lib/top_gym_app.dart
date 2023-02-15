import 'core/config/routes/app.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return BlocBuilder<ProfileUserCubit, ProfileUserState>(
          builder: (context, state) {
            // print(
            //     '-----------------------------------------------------------------------');
            // print(context.read<ProfileUserCubit>().lang);
            return MaterialApp(
              debugShowCheckedModeBanner: true,
              title: "Top Gym",
              onGenerateRoute: AppRoutes.onGenerateRoute,
              locale: Locale(
                  context.read<ProfileUserCubit>().lang == true ? 'ar' : 'en'),
              supportedLocales: AppLocalizationsSetup.supportedLocales,
              localeResolutionCallback:
                  AppLocalizationsSetup.localeResolutionCallback,
              localizationsDelegates:
                  AppLocalizationsSetup.localizationsDelegates,
              theme: AppThemeData.lightTheme,
              darkTheme: AppThemeData.darkTheme,
              themeMode: context.read<ProfileUserCubit>().isCheck == true
                  ? ThemeMode.light
                  : ThemeMode.dark,
            );
          },
        );
      },
    );
  }
}
