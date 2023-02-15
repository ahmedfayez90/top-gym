import '../../../../../../../core/config/routes/app.dart';

class CreateAccount extends StatelessWidget {
  CreateAccount({Key? key}) : super(key: key);
  final GlobalKey<FormState> stepCreateKeyKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    ProfileUserCubit profileCubit = ProfileUserCubit.get(context);
    return Form(
      key: stepCreateKeyKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStringsOfSixPage.almost,
            style: Theme.of(context)
                .textTheme
                .displayLarge!
                .copyWith(fontSize: 11.5.sp),
          ),
          TextFormFieldWidget(
            controller: emailController,
            text: AppStringsOfSixPage.email,
            validator: (val) {
              if (val!.isEmpty || val == '') {
                return 'Please Enter Your Email';
              } else if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9+_.-]+.[com]")
                  .hasMatch(val)) {
                return 'Please Enter Valid as example@gmail.com';
              }
              return null;
            },
            onChanged: (val) {},
          ),
          TextFormFieldWidget(
            controller: passwordController,
            obscureText: context.watch<LoginUserCubit>().obscureText,
            text: AppStringsOfSixPage.password,
            isSuffixIconPassword: true,
            validator: (val) {
              if (val!.isEmpty) {
                return 'Please Enter Your Password';
              } else if (val.length < 6) {
                return 'Please Confirm Password is Week';
              }
              return null;
            },
            onChanged: (val) {},
          ),
          Padding(
              padding: EdgeInsets.only(top: 0.5.h, left: 5.w),
              child: const Text(
                AppStringsOfSixPage.characters,
                style: TextStyle(color: Colors.white38),
              )),
          const Spacer(),
          Center(
            child: Text(
              AppStringsOfSixPage.bySigning,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppColor.textColor),
            ),
          ),
          SizedBox(height: 2.h),
        BlocConsumer<CreateUserCubit, CreateUserState>(
          listener: (ctx, state) {
            if (state is ErrorCreateWeakPasswordState) {
              flutterToast(
                msg: 'The password provided is too weak.',
                color: AppColor.primaryColor,
              );
            } else if (state is ErrorCreateEmailAlreadyInUseState) {
              flutterToast(
                msg: 'The account already exists for that email.',
                color: AppColor.primaryColor,
              );
            } else if (state is ErrorCreateUserState) {
              flutterToast(
                msg: 'Register in Failure',
                color: AppColor.primaryColor,
              );
            } else if (state is SuccessCreateUserState) {
              CacheHelper.putString(key: MyCacheKeys.uId, value: state.uId)
                  .then((value) {
              Navigator.pushNamedAndRemoveUntil(
                context,
                Routes.layoutExercisesUserScreen,
                    (route) => false,
              );
                profileCubit.getUserProfileData();
              });
            }
          },
          builder: (ctx, state) {
            CreateUserCubit cubitCreateUser = CreateUserCubit.get(ctx);
            return Column(
              children: [
                if (state is LoadingCreateUserState)
                  const Center(
                    child: CircularProgressIndicator(
                      color: AppColor.primaryColor,
                    ),
                  ),
                if (state is! LoadingCreateUserState)
                  MainButton(
                    borderRadius: 50,
                    onPressed: () async {
                      if (stepCreateKeyKey.currentState!.validate()) {
                        await cubitCreateUser.signUpWithEmailAndPassword(
                          email: emailController.text,
                          password:  passwordController.text,
                        );
                      }
                    },
                    text: AppStrings.next,
                  )
              ],
            );
          },
        ),
          // CreateAccountButton(
          //   stepCreateKeyKey: stepCreateKeyKey,
          //   email: emailController.text,
          //   password: passwordController.text,
          // ),
          SizedBox(height: 1.h),
        ],
      ),
    );
  }
}
