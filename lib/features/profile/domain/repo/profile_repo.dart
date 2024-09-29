import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
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
}
