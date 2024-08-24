import 'package:dartz/dartz.dart';
import 'package:taswaq/core/errors/exceptions.dart';

import 'package:taswaq/core/errors/failure.dart';

import 'package:taswaq/features/login/data/models/user_model.dart';

import '../../domain/repo/login_repo.dart';
import '../source/login_remote_source.dart';

class LoginRepoImpl extends LoginRepo {
  final LoginRemoteSource _loginRemoteSource;

  LoginRepoImpl(this._loginRemoteSource);
  @override
  Future<Either<Failure, UserModel>> login(
      {required String email, required String password}) async {
    try {
      final response =
          await _loginRemoteSource.login(name: email, password: password);
      return Right(response);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }
}
