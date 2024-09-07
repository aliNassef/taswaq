import 'package:dartz/dartz.dart';
import 'package:taswaq/core/errors/exceptions.dart';
import 'package:taswaq/core/errors/failure.dart';
import 'package:taswaq/core/services/firebase_auth_service.dart';
import 'package:taswaq/features/signup/data/models/user_model.dart';
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
    UserModel? user;
    try {
      user = await signupRemoteSource.signup(email: email, password: password);
      UserEntity data = UserEntity(
        email: user.email,
        name: name,
        id: user.id,
      );
      await addUserData(user: data);
      return Right(data);
    } on CustomException catch (e) {
      if (user != null) {
        await FirebaseAuthService.deleteUser();
      }
      return Left(
        Failure(errMessage: e.errorMessage),
      );
    } catch (e) {
      if (user != null) {
        await FirebaseAuthService.deleteUser();
      }
      return Left(
        Failure(errMessage: 'there is something wrong, please try again'),
      );
    }
  }

  @override
  Future<void> addUserData({required UserEntity user}) async {
    try {
      await dataBaseService.addData(
        path: EndPoints.addUserData,
        data: user.toMap(),
        docId: user.id,
      );
    } catch (e) {
      throw CustomException(errorMessage: e.toString());
    }
  }
}
