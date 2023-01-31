// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import '../../../../../../core/component/toast.dart';
// import '../../../../../../core/config/routes/routes.dart';
// import '../../../../../../core/config/theme/app_color.dart';
// import '../../../../auth/logic/cubit/create_user/create_user_cubit.dart';
//
// class MainScreen extends StatelessWidget {
//   const MainScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<CreateUserCubit, CreateUserState>(
//       listener: (context, state) {
//         if (state is SignOutErrorUserState) {
//           flutterToast(
//             msg: "Error SignOut",
//             color: AppColor.primaryColor,
//           );
//         }
//         if (state is SignOutLoadingUserState) {
//           const Center(
//             child: CircularProgressIndicator(),
//           );
//         }
//         if (state is SignOutSuccessUserState) {
//           Navigator.of(context).pushNamedAndRemoveUntil(
//             Routes.authUser,
//             (route) => false,
//           );
//         }
//       },
//       builder: (context, state) {
//         CreateUserCubit cubit = CreateUserCubit.get(context);
//         return Scaffold(
//           appBar: AppBar(
//             backgroundColor: Colors.redAccent,
//             title: const Text("Main Screen"),
//             actions: [
//               IconButton(
//                 onPressed: () async {
//                   await cubit.signOut();
//                 },
//                 icon: const Icon(Icons.assignment_return_outlined),
//               ),
//             ],
//           ),
//           body: state is SignOutLoadingUserState
//               ? const Center(
//                   child: CircularProgressIndicator(),
//                 )
//               : Container(),
//         );
//       },
//     );
//   }
// }
