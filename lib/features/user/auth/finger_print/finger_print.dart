import 'package:local_auth/local_auth.dart';

class FingerPrint {
  final LocalAuthentication localAuthentication = LocalAuthentication();

  Future<bool> isFingerPrintEnabled() async {
    bool fingerPrintEnabled = await localAuthentication
        .canCheckBiometrics; // this meaning ?????? this line
    return fingerPrintEnabled;
  }

  Future<bool> isAuth(String reason) async {
    bool auth = await localAuthentication.authenticate(
      localizedReason: reason,
      options: const AuthenticationOptions(biometricOnly: true)
    );
    return auth;
  }
}
