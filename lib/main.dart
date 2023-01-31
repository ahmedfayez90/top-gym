import 'package:top_gym/core/config/routes/app_bloc_observer.dart';
import 'core/config/routes/app.dart';
import 'core/config/routes/app_routes.dart';
import 'features/admin/auth/logic/cubit/login_admin/login_admin_cubit.dart';
import 'features/user/auth/logic/cubit/create_user/create_user_cubit.dart';
import 'features/user/auth/logic/cubit/login_user/login_user_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Firebase.initializeApp();
  Bloc.observer = AppBlocObserver();
  return runApp(MyApp(appRoutes: AppRoutes()));
}

class MyApp extends StatelessWidget {

  final AppRoutes appRoutes;
  const MyApp({super.key, required this.appRoutes});
  final double borderRadius = 12;

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => LoginUserCubit()..checkFingerPrint()),
            BlocProvider(create: (context) => CreateUserCubit()),
            BlocProvider(create: (context) => LoginAdminCubit()),
          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: "Top Gym",
            theme: ThemeData(
              scaffoldBackgroundColor: AppColor.backgroundColor,
              colorScheme: ThemeData()
                  .colorScheme
                  .copyWith(primary: AppColor.primaryColor),
              textTheme: TextTheme(
                headline1: const TextStyle(
                  color: AppColor.wColor,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
                headline2: const TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                ),
                //Text Splash Screen : Word Top
                headline3: GoogleFonts.bebasNeue(
                  fontSize: 60,
                  color: Colors.white,
                  letterSpacing: 1.8,
                ),
                //Text Splah Screen : Word Gym
                headline4: GoogleFonts.bebasNeue(
                  fontSize: 60,
                  color: AppColor.yColor,
                  letterSpacing: 1.8,
                ),
                // in welcome screen : word => About you
                headline5: GoogleFonts.lato(
                  fontSize: 42,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                caption: GoogleFonts.lato(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
              ),
              appBarTheme: AppBarTheme(
                backgroundColor: AppColor.noColor,
                elevation: 0.0,
              ),
              inputDecorationTheme: InputDecorationTheme(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide:
                      const BorderSide(color: AppColor.primaryColor, width: 2),
                ),
                disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide:
                      const BorderSide(color: AppColor.primaryColor, width: 2),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: BorderSide(
                      color: AppColor.primaryColor.withOpacity(0.2), width: 2),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide: const BorderSide(color: Colors.red, width: 2),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide:
                      const BorderSide(color: AppColor.primaryColor, width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(borderRadius),
                  borderSide:
                      const BorderSide(color: AppColor.primaryColor, width: 2),
                ),
              ),
            ),
            onGenerateRoute: AppRoutes.onGenerateRoute,
            // home: SaveImageDemo(),
          ),
        );
      },
    );
  }
}
