import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/product_entity/product_entity.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory(
      {required String category});
}
