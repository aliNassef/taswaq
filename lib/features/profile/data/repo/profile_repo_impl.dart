import 'package:taswaq/core/cache/cache_helper.dart';
import 'package:taswaq/core/di/dependency_injuction.dart';
import 'package:taswaq/features/profile/data/source/profile_remote_source.dart';

import '../../../../core/api/end_ponits.dart';
import '../../domain/repo/profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  final ProfileRemoteSource profileRemoteSource;

  ProfileRepoImpl({required this.profileRemoteSource});
  @override
  Future<void> checkPass({required String oldPassword}) {
    throw UnimplementedError();
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
}
