import 'package:dartz/dartz.dart';
import 'package:taswaq/core/errors/failure.dart';
import 'package:taswaq/features/products/domain/entities/product_entity/product_entity.dart';
import 'package:taswaq/features/products/domain/repo/product_repo.dart';

import '../../../../core/errors/exceptions.dart';
import '../source/produt_remote_source.dart';

class ProductRepoImpl extends ProductRepo {
  final ProductRemoteSource _produtRemoteSource;

  ProductRepoImpl(this._produtRemoteSource);
  @override
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory(
      {required String category}) async {
    try {
      final response =
          await _produtRemoteSource.getProductsByCategory(category: category);
      return Right(response.products as List<ProductEntity>);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}
