import 'package:dartz/dartz.dart';
import 'package:taswaq/core/errors/failure.dart';
import 'package:taswaq/features/products/domain/entities/product_entity/product_entity.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory(
      {required String category});
}
