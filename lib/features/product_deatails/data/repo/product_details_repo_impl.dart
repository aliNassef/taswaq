import 'package:dartz/dartz.dart';
import 'package:taswaq/core/api/end_ponits.dart';
import 'package:taswaq/core/services/database_service.dart';
import '../../../../core/errors/exceptions.dart';

import '../../../../core/errors/failure.dart';

import '../../domain/entity/product_detais_entity/product_details_entity.dart';

import '../../domain/repo/product_details_repo.dart';
import '../source/product_details_remote_source.dart';

class ProductDetailsRepoImpl extends ProductDetailsRepo {
  final ProductDetailsRemoteSource productDetailsRemoteSource;
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
    await databaseService.addData(
      path: EndPoints.addToCart,
      data: {
        ApiKey.userId: userId,
        ApiKey.id: product.id,
        ApiKey.quantity: quantity,
        ApiKey.discountPercentage: product.discountPercentage,
        ApiKey.image: product.images![0],
        ApiKey.price: product.price,
        ApiKey.title: product.title,
      },
    );
  }
}
