import 'package:top_gym/features/admin/app/uploaded/logic/upload_product/upload_cubit.dart';
import 'package:top_gym/features/user/app/exercises/presentation/screens/profile_user_data_screen.dart';
import '../../../features/admin/auth/logic/cubit/login_admin/login_admin_cubit.dart';
import 'app.dart';

class AppRoutes {
  static Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.splashScreen:
        return MaterialPageRoute(
          builder: (c) => const SplashScreen(),
        );
      case Routes.phoneAuthPage:
        return MaterialPageRoute(
          builder: (c) => RepositoryProvider(
            create: (context) => PhoneAuthRepository(),
            child: BlocProvider(
              create: (context) => PhoneAuthBloc(
                phoneAuthRepository:
                    RepositoryProvider.of<PhoneAuthRepository>(context),
              ),
              child: const PhoneAuthPage(),
            ),
          ),
        );
      case Routes.authAdmin:
        return MaterialPageRoute(
          builder: (c) => AuthAdmin(),
        );
      case Routes.otpScreen:
        final phoneNumber = routeSettings.arguments;
        return MaterialPageRoute(
          builder: (c) => BlocProvider<LoginAdminCubit>.value(
            value: LoginAdminCubit(),
            child: OtpScreen(phoneNumber: phoneNumber),
          ),
        );
      case Routes.welcomeScreen:
        return MaterialPageRoute(
          builder: (c) => const WelcomeScreen(),
        );
      case Routes.uploadScreen:
        return MaterialPageRoute(
          builder: (c) => BlocProvider(
            create: (context) => UploadCubit(),
            child: UploadScreen(),
          ),
        );
      case Routes.beginnerScreen:
        return MaterialPageRoute(
          builder: (c) => const Beginner(),
        );
      case Routes.inactiveScreen:
        return MaterialPageRoute(
          builder: (c) => const Inavtive(),
        );
      case Routes.typeScreen:
        return MaterialPageRoute(
          builder: (c) => const TypeScreen(),
        );
      case Routes.logInUserScreen:
        return MaterialPageRoute(
          builder: (c) => LogInUserScreen(),
        );
      case Routes.signUpUserScreen:
        return MaterialPageRoute(
          builder: (c) => const SignUpUserScreen(),
        );
      case Routes.authUser:
        return MaterialPageRoute(
          builder: (c) => const AuthUser(),
        );
      case Routes.goalScreen:
        return MaterialPageRoute(
          //final auth = Provider.of<AuthBase>(context, listen: false);
          builder: (c) => MultiBlocProvider(
            providers: [
              BlocProvider(create: (context) => LayoutGoalCubit()..init()),
              BlocProvider(create: (context) => StepOneCubit()),
              BlocProvider(create: (context) => StepThreeCubit()),
              BlocProvider(create: (context) => StepFourthCubit()),
            ],
            child: const LayoutGoalScreen(),
          ),
        );

      //////////////////////////////////////////////////////////////////
      // app User
      case Routes.layoutExercisesUserScreen:
        return MaterialPageRoute(
          builder: (c) => LayoutExercisesUserScreen(),
        );
      case Routes.profileUserDataScreen:
        return MaterialPageRoute(
          builder: (c) =>  ProfileUSerDataScreen(),
        );

      case Routes.landingScreen:
      default:
        return MaterialPageRoute(
          builder: (c) =>
              // BlocProvider<ProfileUserCubit>.value(
              //   value: profileUserCubit!,
              //   child:

              const LandingScreen(),
          // ),
        );
    }
  }

  static Route<dynamic> undefinedRoute() {
    return MaterialPageRoute(
      builder: ((c) => const Scaffold(
            body: Center(
              child: Text(
                AppStrings.noRouteFound,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          )),
    );
  }
}
