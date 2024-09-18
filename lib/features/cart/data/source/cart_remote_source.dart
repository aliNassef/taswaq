import '../../../../core/cache/cache_helper.dart';
import '../../../../core/di/dependency_injuction.dart';
import '../../../../core/services/database_service.dart';
import '../models/cart_model.dart';
import '../../../../core/api/end_ponits.dart';

class CartRemoteSource {
  final DatabaseService databaseService;
  CartRemoteSource({required this.databaseService});

  Stream<List<CartModel>> getUserCart({required String id}) {
    final response = databaseService.getSubCollectionStreamData(
      path: EndPoints.users,
      subCollectionName: EndPoints.carts,
      docId: id,
    );

    return response
        .map((data) => data.map((e) => CartModel.fromJson(e)).toList());
  }

  Future<void> deleteCartItem({required String id}) async {
    await databaseService.deleteSubCollectionData(
      path: EndPoints.users,
      subCollectionName: EndPoints.carts,
      userId: getIt<CacheHelper>().getData(key: ApiKey.userId),
      productId: id,
    );
  }

  Future<void> updateSubCollectionData({
    required int quantity,
    required String id,
  }) async {
    await databaseService.updateSubCollectionData(
      path: EndPoints.users,
      data: {ApiKey.quantity: quantity},
      userId: getIt<CacheHelper>().getData(key: ApiKey.userId),
      docId: id,
      subCollectionName: EndPoints.carts,
    );
  }
}
