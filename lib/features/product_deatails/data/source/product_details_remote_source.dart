import '../../../../core/cache/cache_helper.dart';
import '../../../../core/di/dependency_injuction.dart';
import '../../../../core/services/database_service.dart';

import '../../../../core/api/api_consumer.dart';
import '../../domain/entity/product_detais_entity/product_details_entity.dart';
import '../models/product_detsails_mode/product_details_model.dart';

import '../../../../core/api/end_ponits.dart';

class ProductDetailsRemoteSource {
  final ApiConsumer api;
  final DatabaseService databaseService;
  ProductDetailsRemoteSource(
      {required this.api, required this.databaseService});
  Future<ProductDetailsModel> getProductDetailsById({required int id}) async {
    final response = await api.get('${EndPoints.products}/${id.toString()}');
    return ProductDetailsModel.fromJson(response);
  }

  Future<void> addProductToWishList(
      {required ProductDetailsEntity product}) async {
    await databaseService.addToSubCollection(
      path: EndPoints.users,
      subCollectionName: EndPoints.wishList,
      docId: getIt<CacheHelper>().getData(key: ApiKey.userId),
      data: {
        ApiKey.title: product.title,
        ApiKey.price: product.price,
        ApiKey.discountPercentage: product.discountPercentage,
        ApiKey.image: product.images![0],
        ApiKey.id: product.id,
      },
    );
  }

  Future<void> deleteProductFromWishList({required String id}) async {
    await databaseService.deleteSubCollectionData(
      path: EndPoints.users,
      subCollectionName: EndPoints.wishList,
      userId: getIt<CacheHelper>().getData(key: ApiKey.userId),
      productId: id,
    );
  }

  Future<bool> isProductInWishList({required String id}) async {
    return await databaseService.isProductExist(
      path: EndPoints.users,
      subCollectionName: EndPoints.wishList,
      userId: getIt<CacheHelper>().getData(key: ApiKey.userId),
      productId: id,
    );
  }
}
