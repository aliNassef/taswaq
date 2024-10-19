import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../profile/domain/entity/address_entity.dart';
import '../entity/order_entity.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> addAddress({required AddressEntity address});
  Future<Either<Failure, AddressEntity>> getAddress();
  Future<Either<Failure, void>> addOrder({required OrderEntity order});
}
