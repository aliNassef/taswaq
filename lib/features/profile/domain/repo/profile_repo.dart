import 'package:dartz/dartz.dart';
import '../entity/faqs_entity.dart';

import '../../../../core/errors/failure.dart';
import '../entity/address_entity.dart';
import '../entity/order_entity.dart';
import '../entity/privacy_entity.dart';
import '../entity/terms_entity.dart';

abstract class ProfileRepo {
  Future<void> logout();
  Future<void> checkPass({
    required String oldPassword,
  });
  Future<void> updatePassword({
    required String newPassword,
  });
  void removeUserData();
  Future<Either<Failure, PrivacyEntity>> getPrivacyData();
  Future<Either<Failure, TermsEntity>> getTermsData();
  Future<void> addUserAddress({required AddressEntity data});
  Future<Either<Failure, List<FaqsEntity>>> getFaqs();
  Future<Either<Failure, List<OrderEntity>>> getUserOrders();
}
