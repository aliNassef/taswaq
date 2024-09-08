import 'package:dartz/dartz.dart';
import 'package:taswaq/core/errors/failure.dart';
import 'package:taswaq/features/cart/domain/entities/cart_entity.dart';

abstract class CartRepo {
  Stream<Either<Failure, List<CartEntity>>> getUserCart({required String id});

  Future<void> deleteCartItem({required String id});
  Future<void> updateItemQuantity({
    required String id,
    required int quantity,
  });
}
