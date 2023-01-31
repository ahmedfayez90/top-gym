import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../../../../../core/component/main_button.dart';
import '../../../../../../../core/config/theme/app_color.dart';
import '../../../../../../../core/utils/app_strings.dart';
import '../../../../logic/cubit/layout_goal_logic/layout_goal_cubit.dart';

class StepTwo extends StatelessWidget {
  const StepTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppStringsOfGoalUser.great,
          style:
              Theme.of(context).textTheme.headline1!.copyWith(fontSize: 12.sp),
        ),
        SizedBox(height: 2.h),
        Text(
          AppStringsOfGoalUser.question,
          style: Theme.of(context)
              .textTheme
              .subtitle2!
              .copyWith(color: AppColor.textColor, height: 1.3),
        ),
        SizedBox(height: 2.h),
        Text(
          AppStringsOfGoalUser.now,
          style: Theme.of(context)
              .textTheme
              .subtitle2!
              .copyWith(color: AppColor.textColor, height: 1.3),
        ),
        const Spacer(),
        BlocBuilder<LayoutGoalCubit, LayoutGoalState>(
          builder: (ctx, state) {
            LayoutGoalCubit cubitLayout = LayoutGoalCubit.get(ctx);
            return MainButton(
              borderRadius: 50,
              onPressed: () {
                cubitLayout.nextPageIndicator();
                cubitLayout.pageController.nextPage(
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.ease,
                );
              },
              text: AppStrings.next,
            );
          },
        ),
        SizedBox(height: 1.h),
      ],
    );
  }
}
