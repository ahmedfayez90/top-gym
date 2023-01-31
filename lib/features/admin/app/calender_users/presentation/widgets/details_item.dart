import 'package:flutter/material.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/config/theme/app_color.dart';
import '../../../../../../core/remote_database/firebase_firestore.dart';
import '../../../../../../core/utils/app_controller.dart';
import '../model/client_model.dart';
import 'dialog.dart';


// ignore: must_be_immutable
class DetailsItem extends StatefulWidget {
  ClientModel client;
  DetailsItem({
    Key? key,
    required this.client,
  }) : super(key: key);

  @override
  State<DetailsItem> createState() => _DetailsItemState();
}

class _DetailsItemState extends State<DetailsItem> {
  String dropdownvalue = 'Gym';
  String name = '';
  String note = '';
  int priceM = 200;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 2.w),
      width: 90.w,
      child: Card(
        shape: OutlineInputBorder(
            borderRadius:
                BorderRadius.circular(AppConstDestance.mainBorderRadius)),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.all(2.w),
                      decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(3.sp)),
                      child: Text('Name : ${widget.client.name}')),
                  SizedBox(height: 1.h),
                  Container(
                      padding: EdgeInsets.all(2.w),
                      decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(3.sp)),
                      child: Text('Section : ${widget.client.section} ')),
                 
                  SizedBox(height: 1.h),
                  Container(
                      padding: EdgeInsets.all(2.w),
                      decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(3.sp)),
                      child: Text('Price : ${widget.client.price}')),
                  SizedBox(height: 1.h),
                  Container(
                    padding: EdgeInsets.all(2.w),
                    decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(3.sp)),
                    width: 60.w,
                    child: Text(
                      '''Note : ${widget.client.note}''',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Container(
                decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(AppConstDestance.mainBorderRadius),
                  color: AppColor.yColor,
                ),
                padding: EdgeInsets.all(1.w),
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) => CustomDialog(
                            model: widget.client,
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.edit,
                        size: 30,
                      ),
                    ),
                    SizedBox(height: 2.h),
                    IconButton(
                      onPressed: () {
                        QuickAlert.show(
                          confirmBtnText: 'OK',
                          cancelBtnText: 'Cancle',
                          onConfirmBtnTap: () {
                            deleteFromFirebase(widget.client);
                            Navigator.pop(context);
                          },
                          onCancelBtnTap: () {
                            Navigator.pop(context);
                          },
                          context: context,
                          type: QuickAlertType.warning,
                          text: 'Are you Sure Deilte item',
                        );
                      },
                      icon: const Icon(
                        Icons.delete,
                        size: 30,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 4.w),
            ],
          ),
        ),
      ),
    );
  }
}
