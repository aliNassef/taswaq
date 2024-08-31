import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:taswaq/core/services/database_service.dart';

class FirestoreDatabase implements DatabaseService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    await firestore.collection(path).add(data);
  }

  @override
  Future<Map<String, dynamic>> getData({
    required String path,
    required String docuementId,
  }) async {
    var data = await firestore.collection(path).doc(docuementId).get();
    return data.data() ?? {} as Map<String, dynamic>;
  }
}
