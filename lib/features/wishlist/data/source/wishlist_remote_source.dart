import '../../../../core/api/end_ponits.dart';
import '../../../../core/cache/cache_helper.dart';
import '../../../../core/di/dependency_injuction.dart';
import '../../../../core/services/database_service.dart';
import '../model/wishlist_model.dart';

class WishlistRemoteSource {
  final DatabaseService databaseService;
  WishlistRemoteSource({required this.databaseService});

  Future<List<WishlistModel>> getData({required String id}) async {
    final response = await databaseService.getSubCollectionData(
      path: EndPoints.users,
      subCollectionName: EndPoints.wishList,
      docId: id,
    );

    return response.map((item) => WishlistModel.fromMap(item)).toList();
  }

  Future<void> addProduct({required WishlistModel item}) async {
    await databaseService.addToSubCollection(
      path: EndPoints.users,
      subCollectionName: EndPoints.wishList,
      docId: getIt<CacheHelper>().getData(key: ApiKey.userId),
      data: item.toMap(),
    );
  }

  Future<void> deleteProduct({required String id}) async {
    await databaseService.deleteSubCollectionData(
      path: EndPoints.users,
      subCollectionName: EndPoints.wishList,
      userId: getIt<CacheHelper>().getData(key: ApiKey.userId),
      productId: id,
    );
  }
}
