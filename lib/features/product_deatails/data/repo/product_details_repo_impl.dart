import 'package:dartz/dartz.dart';
import '../../../../core/errors/exceptions.dart';

import '../../../../core/errors/failure.dart';

import '../../domain/entity/product_detais_entity/product_details_entity.dart';

import '../../domain/repo/product_details_repo.dart';
import '../source/product_details_remote_source.dart';

class ProductDetailsRepoImpl extends ProductDetailsRepo {
  final ProductDetailsRemoteSource productDetailsRemoteSource;

  ProductDetailsRepoImpl({
    required this.productDetailsRemoteSource,
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
    await productDetailsRemoteSource.addProductToCart(
      product: product,
      userId: userId,
      quantity: quantity,
    );
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
