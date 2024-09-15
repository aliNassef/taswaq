abstract class DatabaseService {
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? docId,
  });

  Future<void> addToSubCollection({
    required String path,
    required String subCollectionName,
    required String docId,
    required Map<String, dynamic> data,
  });

  Future<Map<String, dynamic>> getData({
    required String path,
    required String docuementId,
  });
  Future<bool> isUserExists({
    required String path,
    required String docuementId,
  });

  Stream<List<Map<String, dynamic>>> getSubCollectionStreamData({
    required String path,
    required String subCollectionName,
    required String docId,
  });

  Future<void> deleteSubCollectionData({
    required String path,
    required String subCollectionName,
    required String userId,
    required String productId,
  });

  Future<void> updateSubCollectionData({
    required String path,
    required String subCollectionName,
    required String userId,
    required String docId,
    required Map<String, dynamic> data,
  });
  Future<List<Map<String, dynamic>>> getSubCollectionData({
    required String path,
    required String subCollectionName,
    required String docId,
  });

  Future<bool> isProductExist({
    required String path,
    required String subCollectionName,
    required String userId,
    required String productId,
  });
}
