import '../../../../../core/config/routes/app.dart';

class AuthAdmin extends StatelessWidget {
  AuthAdmin({Key? key}) : super(key: key);
  final TextEditingController passC = TextEditingController();
  String pass = '';
GlobalKey<FormState> passKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: passKey,
        child: Column(
          children: [
            const Spacer(),
            TextFormFieldWidget(
              controller: passC,
              text: 'Password',
              validator: (val) {
                if (val == null || val.isEmpty) {
                  return "Please enter password";
                }
                if (val != '000') {
                  return 'incorrect  Password';
                }

              },
              onChanged: (val) {
                pass = val;
              },
            ),
            const Spacer(),
            MainButton(
              colorButton: AppColor.noColor,
              onPressed: () {

                if(passKey.currentState!.validate()){
                  if (pass == '000') {
                    Navigator.pushNamed(
                      context,
                      Routes.welcomeScreen,
                    );
                  }
                }


              },
              text: '',
            )
          ],
        ),
      ),
    );
  }
}
