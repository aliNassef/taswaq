import 'package:dartz/dartz.dart';
import 'package:taswaq/features/home/domain/entities/offer_entity/offer_entity.dart';
import '../../../../core/errors/failure.dart';
import '../source/home_remote_source.dart';
import '../../domain/entities/product_entity/product_entity.dart';
import '../../domain/repo/home_repo.dart';

import '../../../../core/errors/exceptions.dart';

class HomeRepoImpl extends HomeRepo {
  final HomeRemoteSource homeRemoteSource;

  HomeRepoImpl({required this.homeRemoteSource});
  @override
  Future<Either<Failure, List<String>>> getCategories() async {
    try {
      final response = await homeRemoteSource.getCategories();
      return Right(response);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      final response = await homeRemoteSource.getProducts();
      return Right(response.products as List<ProductEntity>);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }

  @override
  Future<void> addProductToWishList({required ProductEntity product}) async {
    await homeRemoteSource.addProductToWishList(product: product);
  }

  @override
  Future<bool> isProductInWishList({required String productId}) async {
    return await homeRemoteSource.isProductInWishList(productId: productId);
  }

  @override
  Future<void> deleteProductFromWishList({required String id}) async {
    await homeRemoteSource.deleteProductFromWishList(id: id);
  }

  @override
  Future<Either<Failure, OfferEntity>> getoffers() async {
    try {
      final data = await homeRemoteSource.getOffers();
      return right(data.toEntity());
    } on CustomException catch (e) {
      return left(Failure(errMessage: e.errorMessage));
    }
  }
}
