import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:top_gym/core/config/routes/app.dart';

part 'profile_user_state.dart';

class ProfileUserCubit extends Cubit<ProfileUserState> {
  ProfileUserCubit() : super(ProfileUserInitial());

  static ProfileUserCubit get(context) => BlocProvider.of(context);

  // String lang = AppStrings.englishCode;
  bool lang = CacheHelper.getBoolean(key: MyCacheKeys.local);

  void onChangeValue(bool local) {
    emit(FalseValueState());
    lang = local;
    CacheHelper.putBoolean(key: MyCacheKeys.local, value: local);
    print(
        '5555555555555555555555555555555555555555555 $lang 5555555555555555555555555555555555555555555555');
    emit(TrueValueState());
  }

  // Future<String?> getSavedLang() async {
  //   CacheHelper.containsKey(MyCacheKeys.local)
  //       ? CacheHelper.getString(key: MyCacheKeys.local)
  //       : MyCacheKeys.en;
  //   return null;
  // }
  //
  // Future<bool?> changeLang({required String langCode}) async =>
  //     await CacheHelper.putString(
  //       key: MyCacheKeys.local,
  //       value: langCode,
  //     );

  ///////////////////////////////////////////////////////User Details/////////////////////////////////////////////////////////////////////////
  String userName = '';
  String userImg = '';
  String userEmail = '';

  void initUserDetails() {
    FirebaseAuth.instance.authStateChanges().listen((userData) {
      if (userData != null) {
        userName = userData.displayName ?? '';
        userImg = userData.photoURL ?? '';
        userEmail = userData.email ?? '';
      }
    });
    // userName = profileData!.displayName ?? 'Loading...';
    // (profileData != null ? profileData!.displayName : "Loading...") ??
    //     '';
    // userImg = profileData!.photoURL ?? 'Loading...';
    // (profileData != null ? profileData!.photoURL : "Loading...") ?? '';
    // userEmail = profileData!.email ?? 'Loading...';
    // (profileData != null ? profileData!.email : "Loading...") ?? '';
  }

  ////////////////////////////////////////get user data from fireStore///////////////////////////////////////
  // CollectionReference profileData =
  //     FirebaseFirestore.instance.collection('users');

  // Future<void> getData() async {
  //   // Get docs from collection reference
  //   QuerySnapshot querySnapshot = await profileData.get();
  //
  //   // Get data from docs and convert map to List
  //   final allData = querySnapshot.docs.map((doc) {
  //     doc.data();
  //   }).toList();
  //   log('all Data => ////////////////////////////////////////*********************');
  //   print(allData);
  // }

  UserData? userData;

  void getUserProfileData() {
    emit(GetUserLoadingStates());
    final uId = FirebaseAuth.instance.currentUser?.uid;
    FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      userData = UserData.fromMap(value.data()!, uId!);
      emit(GetUserSuccessStates());
    }).catchError((e) {
      emit(GetUserErrorStates(e: e.toString()));
    });
  }

///////////////////////////////////////////////Update date User ////////////////////////////////////////////////////////
//

  void updateDate({required UserDetails key, required String value}) {
    FirebaseFirestore.instance
        .collection("users")
        .doc(userData!.uid)
        .update({key.name: value}).then((value) {
      emit(UpdateDateSuccess());
    }).catchError((e){
      emit(UpdateDateError());
    });
  }

//   void updateUser({
//      String?      name,
//      String?      phone,
//      String?      email,
//      String?      age,
//      String?      country,
//      String?      zipCode,
//      String?      height,
//      String?      weight,
//      bool ?     male,
//      bool ?     feMale,
//      String?      isUser,
//      String?      phoneNumber,
//   }) {
//     emit(UpdateUserDetailsLoadingState());
//     UserData model = UserData(
//       phoneNumber: phoneNumber ?? userData!.phoneNumber ?? '',
//       imageUrl: '',
//       name: name ?? userData!.name ?? '',
//       uid: userData!.uid,
//       email: email ?? userData!.email ?? '',
//       age: age ?? userData!.age ?? '',
//       country: country ?? userData!.country ?? '',
//       zipCode: zipCode ?? userData!.zipCode ?? '',
//       height: height ?? userData!.height ?? '',
//       weight: weight ?? userData!.weight ?? '',
//       male: male ?? userData!.male ,
//       feMale: feMale ?? userData!.feMale ,
//       isUser: isUser ?? userData!.isUser ?? '',
//     );
//     FirebaseFirestore.instance
//         .collection("users")
//         .doc(userData!.uid)
//         .update(model.toMap())
//         .then((value) {
//           getUserProfileData();
//       emit(UpdateUserDetailsSuccessState());
//     }).catchError((e) {
//       emit(UpdateUserDetailsErrorState());
//     });
//   }

  // void updateUser({
  //   required String name,
  //   required String phone,
  //   required String email,
  //   required String bio,
  //   String? image,
  //   String? cover,
  // }) {
  // UserModel model = UserModel(
  //   phone: phone,
  //   name: name,
  //   bio: bio,
  //   email: email,
  //   cover: cover ?? userModel?.cover,
  //   image: image ?? userModel?.image,
  //   uId: userModel?.uId,
  //   isEmailVerified: false,
  // );
  // FirebaseFirestore.instance
  //     .collection("users")
  //     .doc(userData!.uid)
  //     // .snapshots().listen((event) {  });
  //     .update({ 'age' : ''});

  //     .update(
  //     model.toMap())
  //     .then((value) {
  //   getUserData();
  // }).catchError((e) {
  //   emit(SocialUserUpdateErrorStates());
  // });
  // }

  // void getUserProfileData(UserData userData) {
  //   profileData.snapshots().listen((event) {
  //     event.docs.forEach((element) {
  //       if (userData.uid == element.id) {
  //         log('*******************************************');
  //         log('$userData');
  //         log('*******************************************');
  //       }
  //     });
  //
  //     // for (var doc in event.docs) {
  //     //   userData = doc as UserData;
  //     // }
  //   });
  // }

////////////////////////////////////////////////**** theme *****////////////////////////////////////////////////////////////////////////////

  // ThemeMode themeMode = ThemeMode.light;
  //
  // void checkAppTheme(ThemeMode theme) async{
  //   // SharedPreferences prefs = await SharedPreferences.getInstance();
  //
  //   CacheHelper.putBoolean(key: MyCacheKeys.theme, value: themeMode == ThemeMode.dark ? true : false);
  //   themeMode = theme;
  //   // prefs.setString("theme", themeMode == ThemeMode.light ? 'light' : 'dark');
  //   // notifyListeners();
  //
  // }

  bool isCheck = false;

  void changeAppCheck(bool check) async {
    emit(LightThemeState());

    isCheck = check;
    print(isCheck);
    // await ThemeCacheHelper().cacheTheme(check);
    // bool themeCondition = await ThemeCacheHelper().getCachedTheme();
    // if(themeCondition == false){
    //   themeCondition = true;
    // }else if(themeCondition == true){
    //   themeCondition = false;
    //
    // }
    // CacheHelper.putBoolean(key: MyCacheKeys.theme, value: check);
    // print(
    //     "/////////////////////${themeCondition}///////////////////////////");
    emit(DarkThemeState());
  }

// if(CacheHelper.getBoolean(key: MyCacheKeys.theme) == false){
// CacheHelper.putBoolean(key: MyCacheKeys.theme, value: true);
// }else{
// CacheHelper.putBoolean(key: MyCacheKeys.theme, value: false);
// }

// this must be initial Function when called the cubit
//   Future<bool> authFingerPrint() async {
//     bool isAuth = false;
//     FingerPrint fingerPrint = FingerPrint();
//     bool isFingerPrintEnabled = await fingerPrint.isFingerPrintEnabled();
//     if (isFingerPrintEnabled) {
//       isAuth = await fingerPrint.isAuth('login using finger print');
//     }
//     return isAuth;
//   }
//
// // check fingerprint
//
//   final FingerPrint fingerPrint = FingerPrint();
//   final storage = const FlutterSecureStorage();
//   bool isSwitchChecked = false;
//   String fPrint = '';
//
//   void checkFingerPrint() async {
//     fPrint = await storage.read(key: Keys.fingerPrint) ?? '';
//     isSwitchChecked = fPrint.isNotEmpty;
//     emit(CheckFingerPrintState());
//   }
//
//   void enableFingerPrint(value) async {
//     bool isFingerPrintEnabled = false;
//     if (value) {
//       isFingerPrintEnabled = await fingerPrint.isFingerPrintEnabled();
//       if (isFingerPrintEnabled) {
//         await storage.write(key: Keys.fingerPrint, value: 'checked');
//       }
//     } else {
//       storage.delete(key: Keys.fingerPrint);
//     }
//     isSwitchChecked = value;
//     print("${value} ********************************************************");
//     emit(EnableFingerPrintState());
//   }

  int titleIndex = 0;

  void changeTitleIndex(int index) {
    emit(CurrentChangeTitleIndex());
    titleIndex = index;
    print(titleIndex);
    emit(NextChangeTitleIndex());
  }
}
// import 'package:shared_preferences/shared_preferences.dart';

class ThemeCacheHelper {
  Future<void> cacheTheme(bool themeCon) async {
    final sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("THEME_INDEX", themeCon);
  }

  Future<bool> getCachedTheme() async {
    final sharedPreferences = await SharedPreferences.getInstance();
    final cachedTheme = sharedPreferences.getBool("THEME");
    if (cachedTheme != null) {
      return cachedTheme;
    } else {
      return false;
    }
  }
}
