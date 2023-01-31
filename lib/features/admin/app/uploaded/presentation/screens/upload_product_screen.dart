import '../../../../../../core/config/routes/app.dart';

class UploadScreen extends StatelessWidget {
  UploadScreen({Key? key}) : super(key: key);
  final GlobalKey<FormState> productKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: productKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: Column(
            children: [
              SizedBox(height: 5.h),
              const UploadProductImageButton(),
              BodyUploadView(
                validationName: (val) {
                  if (val == null || val.isEmpty) {
                    return AppStrings.invalidValue;
                  }
                  return null;
                },
                validationDetails: (val) {
                  if (val == null || val.isEmpty) {
                    return AppStrings.invalidValue;
                  }
                  return null;
                },
                validationPrice: (val) {
                  if (val == null || val.isEmpty) {
                    return AppStrings.invalidValue;
                  }
                  return null;
                },
              ),
              SaveProductButton(productKey: productKey),
              SizedBox(height: 2.h),
            ],
          ),
        ),
      ),
    );
  }
}
