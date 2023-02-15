import '../config/routes/app.dart';

abstract class DataBase {
  Future<void> setUserData(UserData userData);

  Stream<List<ProductModel>> newProductStream();

  // Stream<UserData> getUserData();
}

class FireStoreDatabase implements DataBase {
  final _service = FireStoreServices.instance;

  @override
  Future<void> setUserData(UserData userData) async => await _service.setData(
        path: ApiPath.user(userData.uid),
        data: userData.toMap(),
      );

  @override
  Stream<List<ProductModel>> newProductStream() => _service.collectionsStream(
        path: ApiPath.products,
        builder: (data, documentId) => ProductModel.fromMap(data!, documentId),
      );
  //
  // @override
  // Stream<UserData> getUserData() => _service.documentsStream(
  //       path: path,
  //       builder: builder,
  //     );
}
