import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../core/component/main_button.dart';
import '../../../../../../../core/component/toast.dart';
import '../../../../../../../core/config/theme/app_color.dart';
import '../../../../../../../core/utils/app_strings.dart';
import '../../../../logic/cubit/layout_goal_logic/layout_goal_cubit.dart';
import '../../../../logic/cubit/step_three/step_three_cubit.dart';
import '../../../widgets/goal_widgets/button_goal_item.dart';

class StepThree extends StatelessWidget {
  const StepThree({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StepThreeCubit, StepThreeState>(
      builder: (context, state) {
        StepThreeCubit cubit = StepThreeCubit.get(context);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStringsOfGoalUser.whatAre,
              style: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: 12.sp),
            ),
            SizedBox(height: 1.h),
            Text(
              AppStringsOfGoalUser.selectAll,
              style: Theme.of(context)
                  .textTheme
                  .caption!
                  .copyWith(color: AppColor.textColor),
            ),
            SizedBox(height: 5.h),
            ButtonGoalItem(
              onPressed: () {
                cubit.changeButtonColorCompetitiveCount();
              },
              selectedColor: cubit.buttonSelectedCompetitive,
              text: AppStringsOfGoalUser.competitive,
            ),
            ButtonGoalItem(
              text: AppStringsOfGoalUser.gain,
              onPressed: () {
                cubit.changeButtonColorGainMuscleForGeneral();
              },
              selectedColor: cubit.buttonSelectedGainMuscleForGeneral,
            ),
            ButtonGoalItem(
              text: AppStringsOfGoalUser.iamUnderWeight,
              onPressed: () {
                cubit.changeButtonColorIamUnderWeight();
              },
              selectedColor: cubit.buttonSelectedIamUnderWeight,
            ),
            ButtonGoalItem(
              text: AppStringsOfGoalUser.myHealthcare,
              onPressed: () {
                cubit.changeButtonColorMyHealthcare();
              },
              selectedColor: cubit.buttonSelectedMyHealthcare,
            ),
            ButtonGoalItem(
              text: AppStringsOfGoalUser.other,
              onPressed: () {
                cubit.changeButtonColorOther();
              },
              selectedColor: cubit.buttonSelectedOther,
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
        );
      },
    );
  }
}
