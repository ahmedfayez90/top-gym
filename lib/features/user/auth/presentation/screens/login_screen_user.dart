import 'package:top_gym/core/config/routes/app.dart';
import 'package:top_gym/core/helper/my_cache_keys.dart';
import '../../../../../core/component/text_button_widget.dart';
import '../widgets/social_auth_button.dart';

class LogInUserScreen extends StatefulWidget {
 const LogInUserScreen({super.key});

  @override
  State<LogInUserScreen> createState() => _LogInUserScreenState();
}

class _LogInUserScreenState extends State<LogInUserScreen> {
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();



  @override
  void initState() {
    // LoginUserCubit.get(context).checkFingerPrint();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ProfileUserCubit profileCubit =  ProfileUserCubit.get(context);
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      appBar: AppBar(
        title: const Text(AppStringsOfAuthUser.login),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: BlocConsumer<LoginUserCubit, LoginUserState>(
          listener: (context, state) {
            if (state is ErrorLoginWrongPasswordState) {
              flutterToast(
                msg: 'Wrong password provided for that user.',
                color: AppColor.primaryColor,
              );
            } else if (state is ErrorLoginUserNotFoundState) {
              flutterToast(
                msg: 'No user found for that email.',
                color: AppColor.primaryColor,
              );
            } else if (state is ErrorLoginUserState) {
              flutterToast(
                msg: 'Login in Failure',
                color: AppColor.primaryColor,
              );
            } else if (state is SuccessLoginUserState) {
              CacheHelper.putString(key: MyCacheKeys.uId, value: state.uId).then((value) {
                Navigator.pushNamedAndRemoveUntil(
                  context,
                  Routes.layoutExercisesUserScreen,
                      (route) => false,
                );
               profileCubit.getUserProfileData();
              });

            } else if( state is SuccessLoginGoogleUserState){
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.layoutExercisesUserScreen,
                    (route) => false,
              );
            }
          },
          buildWhen: (previous, current) {
            return previous != current;
          },
          builder: (context, state) {
            LoginUserCubit cubit = LoginUserCubit.get(context);
            // cubit.checkFingerPrint();
            return Form(
              key: loginKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    TextFormFieldWidget(
                      text: AppStringsOfAuthUser.emailAddress,
                      validator: (val) {
                        if (val!.isEmpty || val == '') {
                          return 'Please Enter Your Email';
                        } else if (!RegExp(
                                "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[com]")
                            .hasMatch(val)) {
                          return 'Please Enter Valid as example@gmail.com';
                        }
                        return null;
                      },
                      onChanged: (val) {
                        cubit.validTextEmailEmpty(val);
                      },
                      controller: emailController,
                    ),
                    TextFormFieldWidget(
                      text: 'Password',
                      controller: passwordController,
                      maxLines: 1,
                      obscureText: cubit.obscureText,
                      isSuffixIconPassword: true,
                      validator: (val) {
                        if (val!.isEmpty) {
                          return 'Please Fill Failed';
                        }
                        return null;
                      },
                      onChanged: (val) {
                        cubit.validTextPasswordEmpty(val);
                      },
                    ),
                    SizedBox(height: 3.h),
                    if (state is LoadingLoginUserState)
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                    if (state is! LoadingLoginUserState)
                      MainButton(
                        onPressed: () async {
                          if (loginKey.currentState!.validate()) {
                            await cubit.loginWithEmailAndPassword(
                              email: emailController.text,
                              password: passwordController.text,
                            );
                          }
                        },
                        text: AppStringsOfAuthUser.login,
                        borderRadius: 50,
                        isQuestionMaterialColor: true,
                        backgroundColorButtonByMaterial:
                            MaterialStateProperty.resolveWith((states) {
                          if (cubit.isTextPasswordEmpty &&
                              cubit.isTextEmailEmpty) {
                            return AppColor.primaryColor;
                          }
                          return Colors.grey[700];
                        }),
                      ),
                    SizedBox(height: 2.h),
                    TextButtonWidget(
                      text: 'Forgot Password?',
                      onPressed: () {},
                    ),
                    SizedBox(height: 2.h),
                    Text(
                      AppStringsOfAuthUser.textOR,
                      style: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(fontSize: 14.sp),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 2.h),
                    Padding(
                      padding: EdgeInsets.only(left: 25.w),
                      child: SocialAuthButton(
                          onPressed: () {},
                          image: AppImages.facebook,
                          text: AppStringsOfAuthUser.continueWithFacebook),
                    ),
                    SizedBox(height: 5.h),
                    if (state is LoadingLoginGoogleUserState)
                      const Center(child: CircularProgressIndicator()),
                    if (state is! LoadingLoginGoogleUserState)
                      Padding(
                        padding: EdgeInsets.only(right: 25.w),
                        child: SocialAuthButton(
                            onPressed: () async {
                              await cubit.signInWithGoogle();
                            },
                            image: AppImages.g1,
                            text: AppStringsOfAuthUser.continueWithGoogle),
                      ),
                    SizedBox(height: 2.h),
                    if (cubit.fPrint.isNotEmpty)
                      MainButton(
                        onPressed: () {
                          cubit.loginWithFingerPrint();
                        },
                        text: "Login With FingerPrint",
                      ),
                    Text(
                      AppStringsOfAuthUser.textPermission,
                      style: Theme.of(context)
                          .textTheme
                          .caption!
                          .copyWith(color: Colors.grey),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(height: 2.h)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
