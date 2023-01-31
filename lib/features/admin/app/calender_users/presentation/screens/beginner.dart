import 'dart:io';
import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';
import '../../../../../../app/welcome_view/widgets/app_bar_name_and_image.dart';
import '../../../../../../core/component/text_form_field_widget.dart';
import '../../../../../../core/config/theme/app_color.dart';
import '../../../../../../core/remote_database/firebase_firestore.dart';
import '../../../../../../core/utils/app_controller.dart';
import '../../../../../../core/utils/app_images.dart';
import '../../../../../../core/utils/app_strings.dart';
import '../model/client_model.dart';
import '../widgets/drop_down_widget.dart';
import 'inavtive.dart';

class Beginner extends StatefulWidget {
  const Beginner({super.key});

  @override
  State<Beginner> createState() => _BeginnerState();
}

class _BeginnerState extends State<Beginner> {
  GlobalKey<FormState> gymKey = GlobalKey<FormState>();
  var startTimeData = DateTime.now();
  var endTimeData = DateTime.now();
  String name = '';
  String note = '';
  int priceM = 200;
  String dropdownvalue = 'Gym';
  String? imagePath;

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              AppImages.bgImageApp,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Form(
              key: gymKey,
              child: ListView(
                children: [
                  // const TitleWidget(),
                  AppBarNameAndImage(
                      child: imagePath != null
                          ? Image.file(
                              fit: BoxFit.cover,
                              File(imagePath!),
                            )
                          : Container()),
                  TextFormFieldWidget(
                    onChanged: (text) {
                      name = text;
                    },
                    controller: AppControllers.nameC,
                    text: 'name',
                    validator: (val) {
                      if (val!.isEmpty) {
                        return 'Please Enter Name';
                      }
                      return null;
                    },
                  ),
                  TextFormFieldWidget(
                    onChanged: (text) {
                      note = text;
                    },
                    controller: AppControllers.noteC,
                    maxLines: 4,
                    text: 'Notes',
                    validator: (val) {
                      return null;
                    },
                  ),
                  SizedBox(height: 3.h),
                  DropdownButtonWidget(
                    title: 'choose',
                    dropdownvalue: dropdownvalue,
                    items: const ['Gym', 'Gym & Cardio'],
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;

                        if (dropdownvalue == 'Gym') {
                          priceM = 200;
                        } else if (dropdownvalue == 'Gym & Cardio') {
                          priceM = 250;
                        }
                      });
                    },
                  ),
                  SizedBox(height: 5.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'Start Time',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      TextButton(
                        child: Text(
                          '${startTimeData.year} / ${startTimeData.month} / ${startTimeData.day}',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        onPressed: () {
                          openStartTimeDataPicker();
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 2.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        'End Time',
                        style: Theme.of(context).textTheme.headline1,
                      ),
                      TextButton(
                        child: Text(
                          '${endTimeData.year} / ${endTimeData.month} / ${endTimeData.day}',
                          style: Theme.of(context).textTheme.headline2,
                        ),
                        onPressed: () {
                          openEndTimeDatePicker();
                        },
                      ),
                    ],
                  ),
                  SizedBox(height: 5.h),
                  ElevatedButton(
                    style: ButtonStyle(
                      padding: MaterialStateProperty.all(
                          EdgeInsets.symmetric(vertical: 2.h)),
                      backgroundColor:
                          MaterialStateProperty.all(AppColor.primaryColor),
                    ),
                    onPressed: () {
                      if (gymKey.currentState!.validate()) {
                        ClientModel model = ClientModel(
                          name: name,
                          startTime: DateUtils.dateOnly(startTimeData)
                              .microsecondsSinceEpoch,
                          endTime: endTimeData.microsecondsSinceEpoch,
                          section: dropdownvalue,
                          price: priceM,
                          note: note,
                        );

                        QuickAlert.show(
                          confirmBtnText: 'OK',
                          cancelBtnText: 'Cancel',
                          onConfirmBtnTap: () {
                            addClintToFireStore(model);
                            Navigator.pop(context);
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (c) => const Inavtive(),
                              ),
                            );
                            AppControllers.nameC.clear();
                            AppControllers.noteC.clear();
                          },
                          context: context,
                          type: QuickAlertType.success,
                          text: 'Transaction Completed Successfully!',
                        );
                      }
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      imagePath = prefs.getString(AppStrings.appImageKey);
    });
  }
  openStartTimeDataPicker() async {
    var startTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
    );
    if (startTime != null) {
      startTimeData = startTime;
    }
    setState(() {});
  }
  openEndTimeDatePicker() async {
    var endTime = await showDatePicker(
      context: context,
      initialDate: startTimeData.add(const Duration(days: 30)),
      firstDate: startTimeData.add(const Duration(days: 30)),
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
    );
    if (endTime != null) {
      endTimeData = endTime;
    }
    setState(() {});
  }
}
