import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:top_gym/core/utils/api_path.dart';
import 'package:top_gym/features/admin/app/uploaded/presentation/model/product_model.dart';
import '../../features/admin/app/calender_users/presentation/model/client_model.dart';


CollectionReference<ClientModel> getDataFromFirebase() {
  return FirebaseFirestore.instance
      .collection(ApiPath.clients)
      .withConverter<ClientModel>(
    fromFirestore: (docSnapshot, _) {
      return ClientModel.fromJson(docSnapshot.data()!);
    },
    toFirestore: (clientM, _) {
      return clientM.toJson();
    },
  );
}


CollectionReference<ProductModel> getProductFromFirebase() {
  return FirebaseFirestore.instance
      .collection(ApiPath.products)
      .withConverter<ProductModel>(
    fromFirestore: (docSnapshot, _) {
      return ProductModel.fromMap(docSnapshot.data()!,docSnapshot.id);
    },
    toFirestore: (product, _) {
      return product.toMap();
    },
  );
}

Future addProductToFireStore(ProductModel product) {
  CollectionReference<ProductModel> collection = getProductFromFirebase();
  DocumentReference<ProductModel> doc = collection.doc();
  product.id = doc.id;
  return doc.set(product);
}

Future addClintToFireStore(ClientModel client) {
  var collection = getDataFromFirebase();
  var doc = collection.doc();
  client.id = doc.id;
  return doc.set(client);
}


Future<QuerySnapshot<ClientModel>> getClientFromFireStore(DateTime time) async {
  var collection = await getDataFromFirebase();
  return collection
      .where(
        'startTime',
        isEqualTo: DateUtils.dateOnly(time).microsecondsSinceEpoch,
      )
      .get();
}

Stream<QuerySnapshot<ClientModel>> getClientFromFireStoreUsingStream(
    DateTime time) {
  var collection = getDataFromFirebase();
  return collection
      .where(
        'startTime',
        isEqualTo: DateUtils.dateOnly(time).microsecondsSinceEpoch,
      )
      .snapshots();
}

Future<void> deleteFromFirebase(ClientModel client) {
  var collection = getDataFromFirebase();
  return collection.doc(client.id).delete();
}

Future<void> editDataFromFirebase(ClientModel client) {
  var collection = getDataFromFirebase();
  return collection.doc(client.id).update({
    'id': client.id,
    'name': client.name,
    'section': client.section,
    'note': client.note,
    'price': client.price
  });
}
