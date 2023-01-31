import  'package:sizer/sizer.dart';
import 'package:top_gym/core/config/routes/app.dart';
import 'package:top_gym/core/config/theme/app_color.dart';
import '../widgets/admins.dart';
import '../widgets/title_phone_auth.dart';
import '../view/otp_field.dart';
import '../view/phone_number_field.dart';
class PhoneAuthPage extends StatefulWidget {
  const PhoneAuthPage({Key? key}) : super(key: key);

  @override
  State<PhoneAuthPage> createState() => _PhoneAuthPageState();
}

class _PhoneAuthPageState extends State<PhoneAuthPage> {
  late TextEditingController _phoneNumberController;
  late TextEditingController _codeController;

  @override
  void initState() {
    _phoneNumberController = TextEditingController();
    _codeController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _phoneNumberController.dispose();
    _codeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocListener<PhoneAuthBloc, PhoneAuthState>(
          listener: (context, state) {
            if (state is PhoneAuthVerified) {
              Navigator.pushNamedAndRemoveUntil(
                  context, Routes.welcomeScreen, (route) => false);}
            if (state is PhoneAuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  backgroundColor: AppColor.primaryColor,
                  content: Text(state.error),
                ),
              );
            }
          },
          child: BlocBuilder<PhoneAuthBloc, PhoneAuthState>(
            builder: (context, state) {
              if (state is PhoneAuthLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Column(
                  children: [
                    SizedBox(height: 5.h),
                   const Admins(),
                    SizedBox(height: 2.h),
                    const TitlePhoneAuth(),
                    SizedBox(height: 2.h),
                    if (state is! PhoneAuthCodeSentSuccess)
                      PhoneNumberWidget(
                        phoneNumberController: _phoneNumberController,
                      )
                    else
                      OtpWidget(
                        codeController: _codeController,
                        verificationId: state.verificationId,
                      ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
