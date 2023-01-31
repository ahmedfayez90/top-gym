import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../../core/component/main_button.dart';
import '../../../../../../../core/component/text_form_field_widget.dart';
import '../../../../../../../core/component/toast.dart';
import '../../../../../../../core/config/theme/app_color.dart';
import '../../../../../../../core/utils/app_strings.dart';
import '../../../../../core/gools_data.dart';
import '../../../../logic/cubit/layout_goal_logic/layout_goal_cubit.dart';
import '../../../../logic/cubit/step_fourth/step_fourth_cubit.dart';
import '../../../widgets/goal_widgets/button_goal_item.dart';

class StepFourth extends StatelessWidget {
  StepFourth({Key? key}) : super(key: key);
  GlobalKey<FormState> stepFourKey = GlobalKey<FormState>();
  TextEditingController ageC = TextEditingController();
  TextEditingController countryC = TextEditingController();
  TextEditingController zipCodeC = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StepFourthCubit, StepFourthState>(
      builder: (context, state) {
        StepFourthCubit cubit = StepFourthCubit.get(context);
        return Form(
          key: stepFourKey,
          child: ListView(
            children: [
              Text(
                AppStringsOfFourthPage.pleaseSelect,
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 11.5.sp),
              ),
              SizedBox(height: 1.h),
              Row(
                children: [
                  Icon(
                    CupertinoIcons.question_circle_fill,
                    color: AppColor.backGroundListGenerate,
                    size: 15.sp,
                  ),
                  SizedBox(width: 1.w),
                  Text(
                    AppStringsOfFourthPage.which,
                    style: Theme.of(context).textTheme.caption,
                  )
                ],
              ),
              SizedBox(height: 2.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                    child: ButtonGoalItem(
                      borderRadius: 0,
                      onPressed: () {
                        cubit.selectedMaleFun();
                        cubit.selectedFeMale = false;
                      },
                      selectedColor: cubit.selectedMale,
                      text: AppStringsOfFourthPage.mail,
                    ),
                  ),
                  Expanded(
                    child: ButtonGoalItem(
                      borderRadius: 0,
                      onPressed: () {
                        cubit.selectedFeMaleFun();
                        cubit.selectedMale = false;
                      },
                      selectedColor: cubit.selectedFeMale,
                      text: AppStringsOfFourthPage.feMail,
                    ),
                  )
                ],
              ),
              SizedBox(height: 2.h),
              Text(
                AppStringsOfFourthPage.how,
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 11.5.sp),
              ),
              SizedBox(height: 0.5.h),
              TextFormFieldWidget(
                text: AppStringsOfFourthPage.age,
                controller: ageC,
                keyboardType: TextInputType.phone,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Please enter your age';
                  } else if (int.parse(val) < 18 || int.parse(val) > 100) {
                    return "Please select a valid age between 18 and 100 years old";
                  }

                  return null;
                },
                onChanged: (val) {
                  GoalsDataUser.age = val;
                },
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.w, top: 0.5.h),
                child: Text(
                  AppStringsOfFourthPage.weUse,
                  style: Theme.of(context).textTheme.caption,
                ),
              ),
              SizedBox(height: 4.h),
              Text(
                AppStringsOfFourthPage.where,
                style: Theme.of(context)
                    .textTheme
                    .headline1!
                    .copyWith(fontSize: 11.5.sp),
              ),
              SizedBox(height: 0.5.h),
              TextFormFieldWidget(
                text: AppStringsOfFourthPage.country,
                controller: countryC,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Please enter your country';
                  }
                  return null;
                },
                onChanged: (val) {
                  GoalsDataUser.country = val;
                },
              ),
              TextFormFieldWidget(
                text: AppStringsOfFourthPage.zipCode,
                controller: zipCodeC,
                keyboardType: TextInputType.phone,
                validator: (val) {
                  if (val!.isEmpty) {
                    return 'Please enter your zipcode';
                  }
                  return null;
                },
                onChanged: (val) {
                  GoalsDataUser.zipCode = val;
                },
              ),
              SizedBox(height: 18.h),
              BlocBuilder<LayoutGoalCubit, LayoutGoalState>(
                builder: (ctx, state) {
                  LayoutGoalCubit cubitLayout = LayoutGoalCubit.get(ctx);
                  return MainButton(
                    borderRadius: 50,
                    onPressed: () {
                      if (cubit.validGender() == true) {
                        GoalsDataUser.male = cubit.selectedMale;
                        GoalsDataUser.feMale = cubit.selectedFeMale;
                        if (stepFourKey.currentState!.validate()) {
                          cubitLayout.nextPageIndicator();
                          cubitLayout.pageController.nextPage(
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.ease);
                        }
                      } else {
                        flutterToast(
                            msg: "Please Select Gender",
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
