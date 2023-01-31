import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/component/text_form_field_widget.dart';
import '../../../../../../core/config/theme/app_color.dart';
import '../../../../../../core/remote_database/firebase_firestore.dart';
import '../../../../../../core/utils/app_controller.dart';
import '../../../../../../core/utils/app_images.dart';
import '../model/client_model.dart';
import 'drop_down_widget.dart';

class CustomDialog extends StatefulWidget {
const  CustomDialog({super.key, required this.model});
 final ClientModel model;
  @override
  State<CustomDialog> createState() => _DialogState();
}

class _DialogState extends State<CustomDialog> {
  GlobalKey<FormState> updateKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColor.noColor,
      content: Container(
        padding: EdgeInsets.symmetric(horizontal: 2.w),
        width: 90.w,
        height: 60.h,
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(AppConstDestance.mainBorderRadius),
          color: AppColor.yColor,
          image:  const DecorationImage(
              image: AssetImage(AppImages.kareem2), fit: BoxFit.cover),
        ),
        child: Form(
          key: updateKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextFormFieldWidget(
                  onChanged: (text) {
                    widget.model.name = text;
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
                    widget.model.note = text;
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
                  title: 'Chease',
                  dropdownvalue: widget.model.section,
                  items: const ['Gym', 'Gym & Cardio'],
                  onChanged: (String? newValue) {
                    setState(() {
                      widget.model.section = newValue!;
                      if (newValue == 'Gym') {
                        // widget.priceM=200;
                        widget.model.price = 200;
                      } else if (newValue == 'Gym & Cardio') {
                        // widget.priceM=250;
                        widget.model.price = 250;
                      }
                      // widget.dropdownvalue = newValue;

                      // print(
                      //     '*****************************************************************');

                      // print(widget.model.section);
                      // print(widget.model.price);
                      // print(
                      //     '*****************************************************************');
                    });
                  },
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
                    if (updateKey.currentState!.validate()) {
                      editDataFromFirebase(widget.model);
                      AppControllers.nameC.clear();
                      AppControllers.noteC.clear();
                      Navigator.pop(context);
                      // .then((value) {
                      //   QuickAlert.show(
                      //     confirmBtnText: 'OK',
                      //     onConfirmBtnTap: () {

                      //       // widget.model.price = widget.priceM;
                      //       AppControllers.nameC.clear();
                      //       AppControllers.noteC.clear();
                      //       Navigator.pop(context);
                      //       Navigator.pop(context);
                      //     },
                      //     context: context,
                      //     type: QuickAlertType.success,
                      //     text: 'Transaction Completed Successfully!',
                      //   );
                      // }).catchError((e) {
                      //   print(e);
                      //   print(
                      //       '********************************************************');
                      // });
                      // Saved Data
                    }
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          ),
        ),
      ),
      // shape: OutlineInputBorder(borderRadius: ),
    );
  }
}
