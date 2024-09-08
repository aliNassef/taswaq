import 'package:cloud_firestore/cloud_firestore.dart';
import 'database_service.dart';

import '../api/end_ponits.dart';

class FirestoreDatabase implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? docId,
  }) async {
    if (docId != null) {
      firestore.collection(path).doc(docId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String path,
    required String docuementId,
  }) async {
    var data = await firestore.collection(path).doc(docuementId).get();
    return data.data() as Map<String, dynamic>;
  }

  @override
  Future<bool> isUserExists(
      {required String path, required String docuementId}) async {
    var data = await firestore.collection(path).doc(docuementId).get();
    return data.exists;
  }

  @override
  Future<void> addToSubCollection({
    required String path,
    required String subCollectionName,
    required String docId,
    required Map<String, dynamic> data,
  }) async {
    await firestore
        .collection(path)
        .doc(docId)
        .collection(subCollectionName)
        .doc(data[ApiKey.id].toString())
        .set(data);
  }

  @override
  Stream<List<Map<String, dynamic>>> getSubCollectionData({
    required String path,
    required String subCollectionName,
    required String docId,
  }) {
    var data =
        firestore.collection(path).doc(docId).collection(subCollectionName);
    return data.snapshots().map((snapshot) {
      // Convert each document in the snapshot to a Map<String, dynamic>
      return snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  @override
  Future<void> deleteSubCollectionData({
    required String path,
    required String subCollectionName,
    required String userId,
    required String productId,
  }) async {
    await firestore
        .collection(path)
        .doc(userId)
        .collection(subCollectionName)
        .doc(productId)
        .delete();
  }

  @override
  Future<void> updateSubCollectionData({
    required String path,
    required String userId,
    required String subCollectionName,
    required String docId,
    required Map<String, dynamic> data,
  }) async {
    await firestore
        .collection(path)
        .doc(userId)
        .collection(subCollectionName)
        .doc(docId)
        .update(data);
  }
}
