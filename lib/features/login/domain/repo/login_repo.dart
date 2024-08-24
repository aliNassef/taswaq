import 'package:dartz/dartz.dart';
import 'package:taswaq/core/errors/failure.dart';

import '../../data/models/user_model.dart';

abstract class LoginRepo {
  Future<Either<Failure, UserModel>> login({
    required String email,
    required String password,
  });
}
