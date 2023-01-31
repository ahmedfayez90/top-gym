import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../core/component/main_button.dart';
import '../../../../../../../core/component/toast.dart';
import '../../../../../../../core/config/theme/app_color.dart';
import '../../../../../../../core/utils/app_strings.dart';
import '../../../../logic/cubit/layout_goal_logic/layout_goal_cubit.dart';
import '../../../../logic/cubit/step_one/step_one_cubit.dart';
import '../../../widgets/goal_widgets/button_goal_item.dart';

class StepOne extends StatelessWidget {
  const StepOne({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StepOneCubit, StepOneState>(
      builder: (context, state) {
        StepOneCubit cubit = StepOneCubit.get(context);
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppStringsOfGoalUser.letsStart,
                style: Theme.of(context).textTheme.caption!.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
              ),
              SizedBox(height: 1.h),
              Text(
                AppStringsOfGoalUser.selectionGoals,
                style: Theme.of(context).textTheme.caption!.copyWith(
                      color: AppColor.subTitleTextColorInGoalScreen,
                      fontSize: 10.sp,
                    ),
              ),
              SizedBox(height: 5.h),
              ButtonGoalItem(
                text: AppStringsOfGoalUser.loseWeight,
                selectedColor: cubit.buttonSelectedLoseWeight,
                onPressed: () {
                  cubit.changeButtonColorLoseWeight();
                },
              ),
              ButtonGoalItem(
                text: AppStringsOfGoalUser.maintainWeight,
                selectedColor: cubit.buttonSelectedMaintainWeight,
                onPressed: () {
                  cubit.changeButtonColorMaintainWeight();
                },
              ),
              ButtonGoalItem(
                text: AppStringsOfGoalUser.gainWeight,
                selectedColor: cubit.buttonSelectedGainWeight,
                onPressed: () {
                  cubit.changeButtonColorGainWeight();
                },
              ),
              ButtonGoalItem(
                text: AppStringsOfGoalUser.gainMuscle,
                selectedColor: cubit.buttonSelectedGainMuscle,
                onPressed: () {
                  cubit.changeButtonColorGainMuscle();
                },
              ),
              ButtonGoalItem(
                text: AppStringsOfGoalUser.modifyMyDiet,
                selectedColor: cubit.buttonSelectedModifyMyDiet,
                onPressed: () {
                  cubit.changeButtonColorModifyMyDiet();
                },
              ),
              ButtonGoalItem(
                text: AppStringsOfGoalUser.manageStress,
                selectedColor: cubit.buttonSelectedManageStress,
                onPressed: () {
                  cubit.changeButtonColorManageStress();
                },
              ),
              ButtonGoalItem(
                text: AppStringsOfGoalUser.increaseMyStepCount,
                selectedColor: cubit.buttonSelectedIncreaseMyStepCount,
                onPressed: () {
                  cubit.changeButtonColorIncreaseMyStepCount();
                },
              ),

              const Spacer(),
              BlocBuilder<LayoutGoalCubit, LayoutGoalState>(
                builder: (ctx, state) {
                  LayoutGoalCubit cubitLayout = LayoutGoalCubit.get(ctx);
                  return MainButton(
                    borderRadius: 50,
                    onPressed: () {
                      if (cubit.validationFun() >= 1) {
                        cubitLayout.nextPageIndicator();
                        cubitLayout.pageController.nextPage(
                            duration: const Duration(milliseconds: 400),
                            curve: Curves.ease);
                      } else {
                        flutterToast(
                            msg: AppStrings.pleaseSelect,
                            color: AppColor.primaryColor);
                      }
                    },
                    text: AppStrings.next,
                  );
                },
              ),
              SizedBox(height: 1.h),
            ],
          ),
        );
      },
    );
  }
}
