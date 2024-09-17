import 'package:dartz/dartz.dart';
import '../../../../core/api/end_ponits.dart';
import '../../../../core/services/database_service.dart';
import '../../../../core/errors/exceptions.dart';

import '../../../../core/errors/failure.dart';

import '../../domain/entity/product_detais_entity/product_details_entity.dart';

import '../../domain/repo/product_details_repo.dart';
import '../source/product_details_remote_source.dart';

class ProductDetailsRepoImpl extends ProductDetailsRepo {
  final ProductDetailsRemoteSource productDetailsRemoteSource;
  //remove data base service and add logic in remote
  final DatabaseService databaseService;

  ProductDetailsRepoImpl({
    required this.productDetailsRemoteSource,
    required this.databaseService,
  });

  @override
  Future<Either<Failure, ProductDetailsEntity>> getProductDetails(
      {required int id}) async {
    try {
      final response =
          await productDetailsRemoteSource.getProductDetailsById(id: id);
      return Right(response);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }

  @override
  Future<void> addToCart({
    required ProductDetailsEntity product,
    required String userId,
    int? quantity,
  }) async {
    await databaseService.addToSubCollection(
        path: EndPoints.users,
        subCollectionName: EndPoints.carts,
        docId: userId,
        data: {
          ApiKey.id: product.id,
          ApiKey.quantity: quantity,
          ApiKey.discountPercentage: product.discountPercentage,
          ApiKey.image: product.images![0],
          ApiKey.price: product.price,
          ApiKey.title: product.title,
        });
  }

  @override
  Future<void> addProductToWishList(
      {required ProductDetailsEntity product}) async {
    await productDetailsRemoteSource.addProductToWishList(product: product);
  }

  @override
  Future<void> deleteProductFromWishList({required String id}) async {
    await productDetailsRemoteSource.deleteProductFromWishList(id: id);
  }

  @override
  Future<bool> isProductExist({required String id}) async {
    return await productDetailsRemoteSource.isProductInWishList(id: id);
  }
}
