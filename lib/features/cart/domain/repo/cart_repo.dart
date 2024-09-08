import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/cart_entity.dart';

abstract class CartRepo {
  Stream<Either<Failure, List<CartEntity>>> getUserCart({required String id});

  Future<void> deleteCartItem({required String id});
  Future<void> updateItemQuantity({
    required String id,
    required int quantity,
  });
}
