// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../../../../../../core/config/theme/app_color.dart';

// ignore: must_be_immutable
class DropdownButtonWidget extends StatefulWidget {
  DropdownButtonWidget({
    Key? key,
    required this.onChanged,
    required this.title,
    required this.dropdownvalue,
    required this.items,
  }) : super(key: key);
  final String title;
  void Function(String?)? onChanged;
  String dropdownvalue;
  List<String> items;
  @override
  State<DropdownButtonWidget> createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
            color: AppColor.wColor,
            fontSize: 25,
            fontWeight: FontWeight.w400,
          ),
        ),
        Container(
          width: 50.w,
          height: 7.h,
          padding: EdgeInsets.only(right: 3.w),
          margin: EdgeInsets.only(top: 2.h),
          decoration: BoxDecoration(
            border: Border.all(color: AppColor.primaryColor, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          alignment: Alignment.center,
          child: DropdownButton(
            borderRadius: const BorderRadius.all(
              Radius.circular(12),
            ),
            underline: Container(),
            isExpanded: true,
            value: widget.dropdownvalue,
            icon: const Icon(Icons.keyboard_arrow_down),
            items: widget.items.map((String items) {
              return DropdownMenuItem(
                  value: items,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        items,
                        style: const TextStyle(
                            fontSize: 20, color: AppColor.primaryColor),
                      ),
                    ],
                  ));
            }).toList(),
            onChanged: widget.onChanged,
          ),
        )
      ],
    );
  }
}
