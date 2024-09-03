import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:taswaq/core/errors/exceptions.dart';
import 'package:taswaq/core/errors/failure.dart';
import 'package:taswaq/features/signup/domain/entity/user_entity.dart';
import 'package:taswaq/features/signup/domain/repo/signup_repo.dart';

import '../../../../core/api/end_ponits.dart';
import '../../../../core/services/database_service.dart';
import '../source/signup_remote_source.dart';

class SignupRepoImpl extends SignupRepo {
  final SignupRemoteSource signupRemoteSource;
  final DatabaseService dataBaseService;

  SignupRepoImpl(
      {required this.signupRemoteSource, required this.dataBaseService});
  @override
  Future<Either<Failure, UserEntity>> signup({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      var user =
          await signupRemoteSource.signup(email: email, password: password);
      UserEntity data = UserEntity(
        email: user.email,
        name: name,
        id: user.id,
      );
      await addUserData(user: data);
      return Right(data);
    } on ServerException catch (e) {
      return Left(
        Failure(errMessage: e.errorModel.errorMessage),
      );
    } on CustomException catch (e) {
      return Left(
        Failure(errMessage: e.errorMessage),
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
