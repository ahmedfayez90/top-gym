import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import '../../../../../../core/config/theme/app_color.dart';
import '../../../logic/cubit/layout_goal_logic/layout_goal_cubit.dart';

class LayoutGoalScreen extends StatelessWidget {
  const LayoutGoalScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LayoutGoalCubit, LayoutGoalState>(
      builder: (context, state) {
        LayoutGoalCubit cubit = LayoutGoalCubit.get(context);
        return Scaffold(
          backgroundColor: AppColor.backgroundColor,
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                cubit.previsePageIndicator();
                cubit.pageController.previousPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
              },
              icon: const Icon(Icons.arrow_back_ios),
            ),
            title: const Text("Goal"),
          ),
          body: Padding(
            padding: EdgeInsets.all(3.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 1.h),
                StepProgressIndicator(
                  totalSteps: cubit.totalSteps,
                  currentStep: cubit.currentIndex,
                  selectedColor: AppColor.primaryColor,
                  unselectedColor: AppColor.backGroundListGenerate,
                ),
                SizedBox(height: 5.h),
                Expanded(
                  child: PageView.builder(
                    itemCount: cubit.stepsItems.length,
                    physics: const NeverScrollableScrollPhysics(),
                    controller: cubit.pageController,
                    itemBuilder: (context, index) {
                      return cubit.stepsItems[index];
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
