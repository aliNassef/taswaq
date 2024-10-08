import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';

import '../entity/user_entity.dart';

abstract class LoginRepo {
  Future<Either<Failure, UserEntity>> login({
    required String email,
    required String password,
  });

  Future<Either<Failure, UserEntity>> loginWithGoogle();
  Future<void> addUserData({required UserEntity user});
  Future<UserEntity> getUserData({required String uid});
}
