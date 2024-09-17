import '../../../../core/api/end_ponits.dart';
import '../../../../core/cache/cache_helper.dart';
import '../../../../core/di/dependency_injuction.dart';
import '../../../../core/services/database_service.dart';
import '../../domain/entity/wishlisst_entity.dart';
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

  Future<void> addProduct(
      {required WishlistEntity item, required String id}) async {
    await databaseService.addToSubCollection(
      path: EndPoints.users,
      subCollectionName: EndPoints.carts,
      docId: getIt<CacheHelper>().getData(key: ApiKey.userId),
      data: {
        ApiKey.id: int.parse(id),
        ApiKey.quantity: 1,
        ApiKey.discountPercentage: item.discountPercentage,
        ApiKey.image: item.image,
        ApiKey.price: item.price,
        ApiKey.title: item.title,
      },
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
