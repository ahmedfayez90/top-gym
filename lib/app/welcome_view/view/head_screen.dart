import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/helper/image_helper.dart';
import '../../../../core/config/theme/app_color.dart';
import '../../../core/utils/app_strings.dart';
import '../widgets/app_bar_name_and_image.dart';
import '../widgets/show_model_bottom_sheet.dart';

class HeadScreen extends StatefulWidget {
  const HeadScreen({super.key});

  @override
  State<HeadScreen> createState() => _HeadScreenState();
}

class _HeadScreenState extends State<HeadScreen> {
  File? _image;
  String? imagePath;
  final imageHelper = ImageHelper();
  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        showModalBottomSheet(
          backgroundColor: AppColor.noColor,
          context: context,
          builder: (c) => ShowModelBottomSheet(
            galleryFunction: () {
              imageSelector(context, "gallery");
              Navigator.pop(context);
            },
            cameraFunction: () {
              imageSelector(context, "camera");
              Navigator.pop(context);
            },
          ),
        );
      },
      child: AppBarNameAndImage(
        child: imagePath != null
            ? Image.file(
                fit: BoxFit.cover,
                File(imagePath!),
              )
            : Container(),
      ),
    );
  }

  Future imageSelector(BuildContext context, String pickerType) async {
    switch (pickerType) {
      case "gallery":
        final files = await imageHelper.pickImageFromGallery();
        final croppedFile = await imageHelper.crop(
          file: files!,
          cropStyle: CropStyle.circle,
        );
        if (croppedFile != null) {
          saveData(croppedFile.path.toString());
          setState(() {
            _image = File(croppedFile.path);
          });
        }
        break;
      case "camera":
        final files = await imageHelper.pickImageFromCamera();
        if (files != null) {
          saveData(files.path.toString());
          setState(() {
            _image = File(files.path);
          });
          break;
        }
    }
  }

  void saveData(String val) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(AppStrings.appImageKey, val);
    getData();
  }

  void getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      imagePath = prefs.getString(AppStrings.appImageKey);
    });
  }
}
