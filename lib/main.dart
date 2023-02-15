import 'core/config/routes/app.dart';
import 'package:top_gym/features/admin/auth/logic/cubit/login_admin/login_admin_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Firebase.initializeApp();
  Bloc.observer = AppBlocObserver();
  return runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoginUserCubit()..checkFingerPrint()),
        BlocProvider(create: (context) => CreateUserCubit()),
        BlocProvider(create: (context) => LoginAdminCubit()),
        BlocProvider(
          create: (context) => ProfileUserCubit()..getUserProfileData()
            // ..getSavedLang()
            ..initUserDetails(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}
