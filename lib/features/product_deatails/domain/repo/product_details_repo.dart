import 'package:dartz/dartz.dart';
import 'package:taswaq/core/errors/failure.dart';
import 'package:taswaq/features/product_deatails/domain/entity/product_detais_entity/product_details_entity.dart';

abstract class ProductDetailsRepo {
  Future<Either<Failure, ProductDetailsEntity>> getProductDetails({
    required int id,
  });
}
