import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';

import '../entities/product_entity/product_entity.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<String>>> getCategories();
  Future<Either<Failure, List<ProductEntity>>> getProducts();
  Future<void> addProductToWishList({required ProductEntity product});
  Future<void> deleteProductFromWishList({required String id});
  Future<bool> isProductInWishList({required String productId});
}
