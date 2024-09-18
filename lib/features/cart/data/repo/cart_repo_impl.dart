import 'dart:developer';
import 'package:dartz/dartz.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../source/cart_remote_source.dart';
import '../../domain/entities/cart_entity.dart';
import '../../domain/repo/cart_repo.dart';

class CartRepoImpl extends CartRepo {
  final CartRemoteSource cartRemoteSource;
  CartRepoImpl({
    required this.cartRemoteSource,
  });
  @override
  Stream<Either<Failure, List<CartEntity>>> getUserCart(
      {required String id}) async* {
    try {
      final response = cartRemoteSource.getUserCart(id: id);
      await for (final data in response) {
        yield Right(data);
      }
    } on ServerException catch (e) {
      yield Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }

  @override
  Future<void> deleteCartItem({required String id}) async {
    try {
      await cartRemoteSource.deleteCartItem(id: id);
    } catch (e) {
      throw CustomException(errorMessage: e.toString());
    }
  }

  @override
  Future<void> updateItemQuantity(
      {required String id, required int quantity}) async {
    try {
      await cartRemoteSource.updateSubCollectionData(
        quantity: quantity,
        id: id,
      );
    } catch (e) {
      log(e.toString());
      throw CustomException(errorMessage: e.toString());
    }
  }
}
