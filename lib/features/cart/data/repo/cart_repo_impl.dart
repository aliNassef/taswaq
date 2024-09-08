import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:taswaq/core/cache/cache_helper.dart';
import 'package:taswaq/core/di/dependency_injuction.dart';
import 'package:taswaq/core/errors/exceptions.dart';

import 'package:taswaq/core/errors/failure.dart';
import 'package:taswaq/core/services/database_service.dart';
import 'package:taswaq/features/cart/data/source/cart_remote_source.dart';

import 'package:taswaq/features/cart/domain/entities/cart_entity.dart';

import '../../../../core/api/end_ponits.dart';
import '../../domain/repo/cart_repo.dart';

class CartRepoImpl extends CartRepo {
  final CartRemoteSource cartRemoteSource;
  final DatabaseService databaseService;
  CartRepoImpl({required this.cartRemoteSource, required this.databaseService});
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
      await databaseService.deleteSubCollectionData(
        path: EndPoints.users,
        subCollectionName: EndPoints.carts,
        userId: getIt<CacheHelper>().getData(key: ApiKey.userId),
        productId: id,
      );
    } catch (e) {
      throw CustomException(errorMessage: e.toString());
    }
  }

  @override
  Future<void> updateItemQuantity(
      {required String id, required int quantity}) async {
    try {
      await databaseService.updateSubCollectionData(
        path: EndPoints.users,
        data: {ApiKey.quantity: quantity},
        userId: getIt<CacheHelper>().getData(key: ApiKey.userId),
        docId: id,
        subCollectionName: EndPoints.carts,
      );
    } catch (e) {
      log(e.toString());
      throw CustomException(errorMessage: e.toString());
    }
  }
}
