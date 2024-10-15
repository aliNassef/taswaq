import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../profile/domain/entity/address_entity.dart';

abstract class CheckoutRepo {
  Future<Either<Failure, void>> addAddress({required AddressEntity address});
}
