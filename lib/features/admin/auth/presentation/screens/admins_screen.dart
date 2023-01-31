// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sizer/sizer.dart';
// import '../../../../../core/component/image_network_component.dart';
// import '../../../../../core/component/loader_dialog.dart';
// import '../../../../../core/component/toast.dart';
// import '../../../../../core/config/routes/routes.dart';
// import '../../../../../core/config/theme/app_color.dart';
// import '../../../../../core/utils/app_images.dart';
// import '../../../../../core/utils/app_strings.dart';
// import '../../logic/cubit/login_admin/login_admin_cubit.dart';
// import '../widgets/build_phone_form_field.dart';
// import '../widgets/next-button.dart';
// import '../widgets/title_phone_auth.dart';
//
// class AdminsScreen extends StatelessWidget {
//   AdminsScreen({Key? key}) : super(key: key);
//   late String phoneNumber;
//   GlobalKey<FormState> adminKey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: EdgeInsets.all(4.w),
//         child: BlocConsumer<LoginAdminCubit, LoginAdminState>(
//           listenWhen: (previous, current) {
//             return previous != current;
//           },
//           listener: (context, state) {
//             if (state is LoadingLoginAdminState) {
//               LoaderDialog(context: context);
//             }
//             if (state is PhoneNumberSubmitAdminState) {
//               Navigator.pushNamed(context, Routes.otpScreen,
//                   arguments: phoneNumber);
//             }
//             if (state is ErrorLoginAdminState) {
//               Navigator.pop(context);
//               String errorMsg = (state).error;
//               flutterToast(msg: errorMsg, color: AppColor.primaryColor);
//             }
//           },
//           builder: (context, state) {
//             LoginAdminCubit cubit = LoginAdminCubit.get(context);
//             cubit.phoneController.selection = TextSelection.fromPosition(
//               TextPosition(
//                 offset: cubit.phoneController.text.length,
//               ),
//             );
//             return Form(
//               key: adminKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   SizedBox(height: 3.h),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       CircleAvatar(
//                         backgroundColor: AppColor.noColor,
//                         radius: 50,
//                         child: const ImageNetworkComponent(
//                             image: AppNetworkImage.coachAhmed),
//                       ),
//                       SizedBox(width: 10.w),
//                       CircleAvatar(
//                         backgroundColor: AppColor.noColor,
//                         radius: 50,
//                         child: const ImageNetworkComponent(
//                             image: AppNetworkImage.coachKareem),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 2.h),
//                   const TitlePhoneAuth(),
//                   SizedBox(height: 2.h),
//                   BuildPhoneFormField(
//                     textController: cubit.phoneController,
//                     suffixIcon: cubit.phoneController.text.length >= 11
//                         ? Icon(
//                             CupertinoIcons.check_mark_circled_solid,
//                             size: 25.sp,
//                             color: AppColor.wColor,
//                           )
//                         : null,
//                     validator: cubit.validator,
//                     onChanged: (val) {
//                       cubit.onChanges(val);
//                       phoneNumber = val;
//                     },
//                   ),
//
//                   SizedBox(height: 12.h),
//                   if (state is LoadingLoginAdminState)
//                     const Align(
//                       alignment: Alignment.bottomRight,
//                       child: Center(
//                         child: CircularProgressIndicator(),
//                       ),
//                     ),
//                   if (state is! LoadingLoginAdminState)
//                     NextButton(
//                       text: 'Next',
//                       onPresses: () async {
//                         if (adminKey.currentState!.validate()) {
//
//                           adminKey.currentState!.save();
//                           BlocProvider.of<LoginAdminCubit>(context)
//                               .submitPhoneNumber(phoneNumber: phoneNumber);
//
//
//                         }
//                       },
//                     ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
//
// }
