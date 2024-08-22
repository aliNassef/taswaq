import 'package:dartz/dartz.dart';
import '../../../../core/errors/exceptions.dart';

import '../../../../core/errors/failure.dart';

import '../../domain/entity/product_detais_entity/product_details_entity.dart';

import '../../domain/repo/product_details_repo.dart';
import '../source/product_details_remote_source.dart';

class ProductDetailsRepoImpl extends ProductDetailsRepo {
  final ProductDetailsRemoteSource _productDetailsRemoteSource;

  ProductDetailsRepoImpl(this._productDetailsRemoteSource);

  @override
  Future<Either<Failure, ProductDetailsEntity>> getProductDetails(
      {required int id}) async {
    try {
      final response =
          await _productDetailsRemoteSource.getProductDetailsById(id: id);
      return Right(response);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}
