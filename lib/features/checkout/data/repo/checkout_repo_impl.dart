import 'package:dartz/dartz.dart';

import 'package:taswaq/core/errors/failure.dart';

import '../../../profile/domain/entity/address_entity.dart';
import '../../domain/repo/checkout_repo.dart';
import '../source/checkout_remote_source.dart';

class CheckoutRepoImpl extends CheckoutRepo {
  final CheckoutRemoteSource checkoutRemoteSource;

  CheckoutRepoImpl({required this.checkoutRemoteSource});
  @override
  Future<Either<Failure, void>> addAddress(
      {required AddressEntity address}) async {
    try {
      await checkoutRemoteSource.addAddress(address: address);
      return right(null);
    } catch (e) {
      return left(Failure(errMessage: e.toString()));
    }
  }
}
