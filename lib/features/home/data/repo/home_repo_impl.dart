import 'package:dartz/dartz.dart';
import 'package:taswaq/core/errors/failure.dart';
import 'package:taswaq/features/home/data/source/home_remote_source.dart';
import 'package:taswaq/features/home/domain/entities/product_entity/product_entity.dart';
import 'package:taswaq/features/home/domain/repo/home_repo.dart';

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
}
