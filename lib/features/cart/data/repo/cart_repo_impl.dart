import 'package:dartz/dartz.dart';
import 'package:taswaq/core/errors/exceptions.dart';

import 'package:taswaq/core/errors/failure.dart';
import 'package:taswaq/features/cart/data/source/cart_remote_source.dart';

import 'package:taswaq/features/cart/domain/entities/cart_entity.dart';

import '../../domain/repo/cart_repo.dart';

class CartRepoImpl extends CartRepo {
  final CartRemoteSource _cartRemoteSource;

  CartRepoImpl(this._cartRemoteSource);
  @override
  Future<Either<Failure, List<CartEntity>>> getUserCart(
      {required String id}) async {
    try {
      final response = await _cartRemoteSource.getUserCart(id: id);
      return Right(response);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}
