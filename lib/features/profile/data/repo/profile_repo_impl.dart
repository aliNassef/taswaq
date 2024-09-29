import 'dart:developer';
import 'package:dartz/dartz.dart';
import '../../../../core/cache/cache_helper.dart';
import '../../../../core/di/dependency_injuction.dart';
import '../../../../core/errors/exceptions.dart';
import '../../../../core/errors/failure.dart';
import '../source/profile_remote_source.dart';
import '../../domain/entity/privacy_entity.dart';
import '../../domain/entity/terms_entity.dart';

import '../../../../core/api/end_ponits.dart';
import '../../domain/repo/profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ProfileRemoteSource profileRemoteSource;

  ProfileRepoImpl({required this.profileRemoteSource});
  @override
  Future<void> checkPass({required String oldPassword}) async {
    try {
      await profileRemoteSource.checkPass(oldPassword: oldPassword);
    } catch (e) {
      log(
        e.toString(),
      );
      throw CustomException(errorMessage: 'wrong password');
    }
  }

  @override
  Future<void> logout() async {
    removeUserData();
    await profileRemoteSource.logout();
  }

  // need to refactor
  @override
  void removeUserData() {
    getIt<CacheHelper>().clearData(key: ApiKey.userId);
    getIt<CacheHelper>().clearData(key: ApiKey.email);
    getIt<CacheHelper>().clearData(key: ApiKey.name);
    getIt<CacheHelper>().clearData(key: ApiKey.isLoggedIn);
  }

  @override
  Future<void> updatePassword({required String newPassword}) async {
    await profileRemoteSource.updatePass(newPassword: newPassword);
  }

  @override
  Future<Either<Failure, PrivacyEntity>> getPrivacyData() async {
    try {
      final data = await profileRemoteSource.getPrivacyData();
      return Right(data);
    } catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failure, TermsEntity>> getTermsData() async {
    try {
      return Right(await profileRemoteSource.getTermsData());
    } catch (e) {
      return Left(Failure(errMessage: e.toString()));
    }
  }
}
