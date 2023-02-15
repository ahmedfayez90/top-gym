// import 'dart:developer';
//
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:top_gym/core/config/routes/top_gym_app.dart';
//
// class CloudStorageServices {
//   CloudStorageServices._();
//
//   static final instance = CloudStorageServices._();
//   final _cloudStorage = FirebaseStorage.instance;
//   String? url;
//
//   Future<void> uploadImage(
//       {required String imageName, required File file}) async {
//     Reference refStorage =
//         _cloudStorage.ref("${ApiPath.productsImage}/$imageName");
//     await refStorage.putFile(file);
//     url = await refStorage.getDownloadURL();
//     log("${url!} the url of link image");
//     log(await refStorage.getDownloadURL());
//   }
//
//   Future<String> linkImage() async => url ?? '';
// }
