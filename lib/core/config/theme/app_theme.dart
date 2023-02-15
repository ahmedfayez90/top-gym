import '../routes/app.dart';

class AppThemeData {
  static const double borderRadius = 12;
  static final ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.darkBackgroundColor,
    textTheme: TextTheme(
      headline6: TextStyle(
        fontSize: 15.sp,
        fontWeight: FontWeight.bold,
        color: AppColor.darkPrimaryColor,
      ),
    ),
  );
  static final ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: AppColor.backgroundColor,
    cardColor: AppColor.bColor,
    hoverColor: AppColor.grayColor,
    primaryColor: AppColor.primaryColor,
    splashColor: AppColor.redColor,
    colorScheme:
        ThemeData().colorScheme.copyWith(primary: AppColor.primaryColor),
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
      headline6: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.bold,
          color: AppColor.primaryColor),

      caption: GoogleFonts.lato(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Colors.white,
      ),
      button: TextStyle(
        fontSize: 12.sp,
        color: AppColor.subTitleTextColorInGoalScreen,
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColor.noColor,
      elevation: 0,
      centerTitle: true,
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: const BorderSide(color: AppColor.primaryColor, width: 2),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: const BorderSide(color: AppColor.primaryColor, width: 2),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide:
            BorderSide(color: AppColor.primaryColor.withOpacity(0.2), width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: const BorderSide(color: AppColor.primaryColor, width: 2),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(borderRadius),
        borderSide: const BorderSide(color: AppColor.primaryColor, width: 2),
      ),
    ),
  );
}
