import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:top_gym/core/config/routes/app.dart';

class FireStoreServices {
  FireStoreServices._();

  static final instance = FireStoreServices._();
  final _fireStore = FirebaseFirestore.instance;

  Future<void> setData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    final reference = _fireStore.doc(path);

    debugPrint('Request Data : $data');
    await reference.set(data);
  }

  Future<void> deleteData({required String path}) async {
    final reference = _fireStore.doc(path);
    await reference.delete();
  }

////    مجموعى من Collections جوه ال Document
  Stream<T> documentsStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentId)
        builder, // fromJson
  }) {
    final reference = _fireStore.doc(path);
    final snapShots = reference.snapshots();
    return snapShots.map((snapshot) => builder(snapshot.data(), snapshot.id));
  }

  //// Stream of Document جوه  Collection
  Stream<List<T>> collectionsStream<T>({
    required String path,
    required T Function(Map<String, dynamic>? data, String documentId)
        builder, // fromJson
    Query Function(Query query)? queryBuilder,
    int Function(T lhs, T rhs)? sort,
  }) {
    Query query = _fireStore.collection(path);
    if (queryBuilder != null) {
      query = queryBuilder(query);
    }
    final snapShots = query.snapshots();
    return snapShots.map((snapShot) {
      final result = snapShot.docs
          .map((snapshot) =>
              builder(snapshot.data() as Map<String, dynamic>, snapshot.id))
          .where((value) => value != null)
          .toList();
      if (sort != null) {
        result.sort(sort);
      }
      return result;
    });
  }


}
