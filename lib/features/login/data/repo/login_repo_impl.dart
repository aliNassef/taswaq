import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:taswaq/core/api/end_ponits.dart';
import 'package:taswaq/core/errors/exceptions.dart';
import 'package:taswaq/core/errors/failure.dart';
import 'package:taswaq/core/services/database_service.dart';
import 'package:taswaq/features/login/domain/entity/user_entity.dart';

import '../../domain/repo/login_repo.dart';
import '../source/login_remote_source.dart';

class LoginRepoImpl extends LoginRepo {
  final LoginRemoteSource loginRemoteSource;
  final DatabaseService dataBaseService;
  LoginRepoImpl(
      {required this.loginRemoteSource, required this.dataBaseService});
  @override
  Future<Either<Failure, UserEntity>> login(
      {required String email, required String password}) async {
    try {
      final response =
          await loginRemoteSource.login(email: email, password: password);
      addUserData(user: response);
      return Right(response);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithGoogle() async {
    try {
      final response = await loginRemoteSource.loginWithGoogle();
      return Right(response);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errorMessage));
    } on CustomException catch (e) {
      log('google signin error: ${e.toString()}');
      return Left(
        Failure(
          errMessage: 'there is something wrong, please try again',
        ),
      );
    } catch (e) {
      return Left(
        Failure(
          errMessage: 'there is something wrong, please try again',
        ),
      );
    }
  }

  @override
  Future<void> addUserData({required UserEntity user}) async {
    await dataBaseService.addData(
      path: EndPoints.addUserData,
      data: user.toMap(),
    );
  }
}
