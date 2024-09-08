import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:taswaq/core/api/end_ponits.dart';
import 'package:taswaq/core/errors/exceptions.dart';
import 'package:taswaq/core/errors/failure.dart';
import 'package:taswaq/core/services/database_service.dart';
import 'package:taswaq/core/services/firebase_auth_service.dart';
import 'package:taswaq/features/login/domain/entity/user_entity.dart';

import '../../domain/repo/login_repo.dart';
import '../models/user_model.dart';
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
      var data = await getUserData(uid: response.uid);
      return Right(data);
    } on CustomException catch (e) {
      return Left(Failure(errMessage: e.errorMessage));
    } catch (e) {
      log(e.toString());
      return Left(
          Failure(errMessage: 'there is something wrong, please try again'));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> loginWithGoogle() async {
    UserModel? user;
    try {
      user = await loginRemoteSource.loginWithGoogle();
      log('user: ${user.id}');
      var isUserExists = await dataBaseService.isUserExists(
        path: EndPoints.users,
        docuementId: user.id!,
      );
      if (isUserExists) {
        await getUserData(uid: user.id!);
      } else {
        await addUserData(user: user);
      }
      return Right(user);
    } on CustomException catch (e) {
      if (user != null) {
        FirebaseAuthService.deleteUser();
      }
      log('google signin error: ${e.toString()}');
      return Left(
        Failure(
          errMessage: 'there is something wrong, please try again',
        ),
      );
    } catch (e) {
      log(e.toString());
      if (user != null) {
        FirebaseAuthService.deleteUser();
      }
      return Left(
        Failure(
          errMessage: 'there is something wrong, please try again',
        ),
      );
    }
  }

  @override
  Future<void> addUserData({required UserEntity user}) async {
    try {
      await dataBaseService.addData(
        path: EndPoints.addUserData,
        docId: user.id,
        data: user.toMap(),
      );
    } catch (e) {
      throw CustomException(errorMessage: e.toString());
    }
  }

  @override
  Future<UserEntity> getUserData({required String uid}) async {
    try {
      final response = await dataBaseService.getData(
        path: EndPoints.getUserData,
        docuementId: uid,
      );
      return UserModel.fromJson(response);
    } catch (e) {
      throw CustomException(errorMessage: e.toString());
    }
  }
}
