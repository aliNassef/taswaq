import 'package:taswaq/core/errors/exceptions.dart';

import '../../../../core/services/database_service.dart';
import '../../../../core/shared/functions/get_user_data.dart';
import '../../domain/entities/product_entity/product_entity.dart';

import '../../../../core/api/api_consumer.dart';
import '../../../../core/api/end_ponits.dart';
import '../models/offers/offer_model.dart';
import '../models/product_model/product_model.dart';

class HomeRemoteSource {
  final ApiConsumer api;
  final DatabaseService databaseService;
  const HomeRemoteSource({
    required this.api,
    required this.databaseService,
  });
  Future<ProductModel> getProducts() async {
    final response = await api.get(EndPoints.products);

    return ProductModel.fromJson(response);
  }

  Future<List<String>> getCategories() async {
    final response = await api.get(EndPoints.categories);
    return List<String>.from(response);
  }

  Future<void> addProductToWishList({required ProductEntity product}) async {
    await databaseService.addToSubCollection(
      path: EndPoints.users,
      subCollectionName: EndPoints.wishList,
      docId: getUserData().id!,
      data: {
        ApiKey.title: product.title,
        ApiKey.price: product.price,
        ApiKey.discountPercentage: product.discountPercentage,
        ApiKey.image: product.thumbnail,
        ApiKey.id: product.id,
      },
    );
  }

  Future<bool> isProductInWishList({required String productId}) async {
    return await databaseService.isProductExist(
      path: EndPoints.users,
      subCollectionName: EndPoints.wishList,
      userId: getUserData().id!,
      productId: productId,
    );
  }

  Future<void> deleteProductFromWishList({required String id}) async {
    await databaseService.deleteSubCollectionData(
      path: EndPoints.users,
      subCollectionName: EndPoints.wishList,
      userId: getUserData().id!,
      productId: id,
    );
  }

  Future<OfferModel> getOffers() async {
    try {
      final response = await databaseService.getDataWithoutId(
        path: EndPoints.offers,
      );
      return OfferModel.fromJson(response.first);
    } catch (e) {
      throw CustomException(errorMessage: 'something went wrong');
    }
  }
}
