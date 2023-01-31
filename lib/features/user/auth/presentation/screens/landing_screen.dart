import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_gym/app/welcome_view/screens/welcome_screen.dart';
import '../../../../admin/app/calender_users/presentation/screens/type_screen.dart';
import '../../../app/exercises/presentation/screens/layout_exercises_user_screen.dart';
import '../../logic/cubit/create_user/create_user_cubit.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateUserCubit, CreateUserState>(
      builder: (context, state) {
        CreateUserCubit cubit = CreateUserCubit.get(context);
        return StreamBuilder(
          stream: cubit.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active) {
              final user = snapshot.data;

              if (user == null) {
                return const TypeScreen();
              }


              if (user.phoneNumber == null) {
                return LayoutExercisesUserScreen();
              }
              if(user.phoneNumber != null){
                return const WelcomeScreen();
              }

            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        );
      },
    );
  }
}
