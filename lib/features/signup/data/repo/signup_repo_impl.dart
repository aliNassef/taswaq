import 'package:dartz/dartz.dart';
import 'package:taswaq/core/errors/exceptions.dart';
import 'package:taswaq/core/errors/failure.dart';
import 'package:taswaq/features/signup/domain/entity/user_entity.dart';
import 'package:taswaq/features/signup/domain/repo/signup_repo.dart';

import '../source/signup_remote_source.dart';

class SignupRepoImpl extends SignupRepo {
  final SignupRemoteSource _signupRemoteSource;

  SignupRepoImpl(this._signupRemoteSource);
  @override
  Future<Either<Failure, UserEntity>> signup(
      {required String name,
      required String email,
      required String password}) async {
    try {
      var data =
          await _signupRemoteSource.signup(name: name, password: password);

      return Right(data);
    } on ServerException catch (e) {
      return Left(
        Failure(errMessage: e.errorModel.errorMessage),
      );
    }
  }
}
