import 'package:dartz/dartz.dart';
import 'package:taswaq/core/errors/failure.dart';
import 'package:taswaq/features/signup/domain/entity/user_entity.dart';

abstract class SignupRepo {
  Future<Either<Failure, UserEntity>> signup({
    required String name,
    required String email,
    required String password,
  });
  Future<void> addUserData({required UserEntity user});
  // Future<void> deleteUserData();
}
