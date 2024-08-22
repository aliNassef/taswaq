import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entity/product_detais_entity/product_details_entity.dart';

abstract class ProductDetailsRepo {
  Future<Either<Failure, ProductDetailsEntity>> getProductDetails({
    required int id,
  });
}
