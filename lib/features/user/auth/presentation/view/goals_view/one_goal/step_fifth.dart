import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';
import '../../../../../../../core/component/main_button.dart';
import '../../../../../../../core/component/text_form_field_widget.dart';
import '../../../../../../../core/config/theme/app_color.dart';
import '../../../../../../../core/utils/app_strings.dart';
import '../../../../../core/gools_data.dart';
import '../../../../logic/cubit/layout_goal_logic/layout_goal_cubit.dart';

class StepFifth extends StatelessWidget {
  StepFifth({Key? key}) : super(key: key);
  GlobalKey<FormState> stepFifeKey = GlobalKey<FormState>();
TextEditingController weightC = TextEditingController();
TextEditingController heightC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: stepFifeKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppStringsOfFifthStep.howTall,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(fontSize: 11.5.sp),
          ),
          TextFormFieldWidget(
            keyboardType: TextInputType.phone,
            controller: heightC,
            text: AppStringsOfFifthStep.height,
            validator: (val) {
              if (val!.isEmpty) {
                return 'Please enter a valid height value';
              }
              return null;
            },
            onChanged: (val) {
              GoalsDataUser.height = val;
            },
          ),
          SizedBox(height: 5.h),
          Text(
            AppStringsOfFifthStep.howMuch,
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(fontSize: 11.5.sp),
          ),
          TextFormFieldWidget(
            keyboardType: TextInputType.phone,
            controller: weightC,
            text: AppStringsOfFifthStep.weight,
            validator: (val) {
              if (val!.isEmpty) {
                return 'Please enter a valid weight value';
              }
              return null;
            },
            onChanged: (val) {
              GoalsDataUser.weight = val;
            },
          ),
          Padding(
            padding: EdgeInsets.only(left: 5.w, top: 0.5.h),
            child: Text(
              AppStringsOfFifthStep.itsOk,
              style: TextStyle(
                color: AppColor.backGroundListGenerate,
              ),
            ),
          ),
          const Spacer(),
          BlocBuilder<LayoutGoalCubit, LayoutGoalState>(
            builder: (ctx, state) {
              LayoutGoalCubit cubitLayout = LayoutGoalCubit.get(ctx);
              return MainButton(
                borderRadius: 50,
                onPressed: () {
                  if (stepFifeKey.currentState!.validate()) {

                    cubitLayout.nextPageIndicator();
                    cubitLayout.pageController.nextPage(
                        duration: const Duration(milliseconds: 400),
                        curve: Curves.ease);
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
  }
}
