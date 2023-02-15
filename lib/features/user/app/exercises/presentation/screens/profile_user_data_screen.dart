import 'package:top_gym/features/user/app/exercises/presentation/date/controllers/user_details_controllers.dart';
import 'package:top_gym/features/user/app/exercises/presentation/view/user_details/field_user_details.dart';
import '../../../../../../core/config/routes/app.dart';

class ProfileUSerDataScreen extends StatelessWidget {
  const ProfileUSerDataScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.wColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Theme.of(context).cardColor,
          ),
        ),
        title: Text(
          "Edit Profile",
          style: TextStyle(color: Theme.of(context).cardColor),
        ),
        actions: [
          BlocBuilder<ProfileUserCubit, ProfileUserState>(
            builder: (context, state) {
              return IconButton(
                splashColor: AppColor.noColor,
                onPressed: () {
                  // context.read<ProfileUserCubit>().updateUser(
                  //       name: UserDetailsControllers.nameController.text,
                  //       phone: UserDetailsControllers.phoneController.text,
                  //       email: UserDetailsControllers.emailController.text,
                  //       age: UserDetailsControllers.ageController.text,
                  //       country: UserDetailsControllers.countryController.text,
                  //       zipCode: UserDetailsControllers.zipCodeController.text,
                  //       height: UserDetailsControllers.heightController.text,
                  //       weight: UserDetailsControllers.weightController.text,
                  //       male: UserDetailsControllers.genderController.text ==
                  //               'male'
                  //           ? true
                  //           : false,
                  //       feMale: UserDetailsControllers.genderController.text ==
                  //               'male'
                  //           ? false
                  //           : true,
                  //       isUser: UserDetailsControllers.userController.text,
                  //       phoneNumber: UserDetailsControllers.nameController.text,
                  //     );
                },
                icon: Icon(
                  Icons.check,
                  size: 25.sp,
                  color: Theme.of(context).cardColor,
                ),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const ProfilePhoto(),
            SizedBox(height: 3.h),
            Text(
              'Your Information',
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).cardColor,
                  ),
            ),
            SizedBox(height: 3.h),
            // BlocConsumer<ProfileUserCubit, ProfileUserState>(
            //   listener: (context, state) {
            // if (state is UpdateUserDetailsSuccessState) {
            //   flutterToast(
            //       msg: "Success Edit", color: AppColor.primaryColor);
            // } else if (state is UpdateUserDetailsErrorState) {
            //   flutterToast(msg: "Error", color: AppColor.primaryColor);
            // } else if (state is UpdateUserDetailsLoadingState) {
            //   const Center(
            //     child: CircularProgressIndicator(),
            //   );
            // }
            // },
            // builder: (context, state) {
            //   var cubit = ProfileUserCubit.get(context);
            //   return
            FieldUserDetails(),
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
