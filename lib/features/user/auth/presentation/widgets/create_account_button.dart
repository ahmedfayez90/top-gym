// import '../../../../../core/config/routes/app.dart';
//
// class CreateAccountButton extends StatelessWidget {
// const  CreateAccountButton({
//     Key? key,
//     required this.stepCreateKeyKey,
//     required this.email,
//     required this.password,
//   }) : super(key: key);
//   final GlobalKey<FormState> stepCreateKeyKey;
//   final String email;
//   final String password;
//
//   @override
//   Widget build(BuildContext context) {
//     ProfileUserCubit profileCubit = ProfileUserCubit.get(context);
//     return BlocConsumer<CreateUserCubit, CreateUserState>(
//       listener: (ctx, state) {
//         if (state is ErrorCreateWeakPasswordState) {
//           flutterToast(
//             msg: 'The password provided is too weak.',
//             color: AppColor.primaryColor,
//           );
//         } else if (state is ErrorCreateEmailAlreadyInUseState) {
//           flutterToast(
//             msg: 'The account already exists for that email.',
//             color: AppColor.primaryColor,
//           );
//         } else if (state is ErrorCreateUserState) {
//           flutterToast(
//             msg: 'Register in Failure',
//             color: AppColor.primaryColor,
//           );
//         } else if (state is SuccessCreateUserState) {
//           // CacheHelper.putString(key: MyCacheKeys.uId, value: state.uId)
//           //     .then((value) {
//             Navigator.pushNamedAndRemoveUntil(
//               context,
//               Routes.layoutExercisesUserScreen,
//               (route) => false,
//             );
//           //   profileCubit.getUserProfileData();
//           // });
//         }
//       },
//       builder: (ctx, state) {
//         CreateUserCubit cubitCreateUser = CreateUserCubit.get(ctx);
//         return Column(
//           children: [
//             if (state is LoadingCreateUserState)
//               const Center(
//                 child: CircularProgressIndicator(
//                   color: AppColor.primaryColor,
//                 ),
//               ),
//             if (state is! LoadingCreateUserState)
//               MainButton(
//                 borderRadius: 50,
//                 onPressed: () async {
//                   if (stepCreateKeyKey.currentState!.validate()) {
//                     await cubitCreateUser.signUpWithEmailAndPassword(
//                       email: email,
//                       password: password,
//                     );
//                   }
//                 },
//                 text: AppStrings.next,
//               )
//           ],
//         );
//       },
//     );
//   }
// }
