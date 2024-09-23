import 'package:taswaq/core/api/end_ponits.dart';
import 'package:taswaq/core/cache/cache_helper.dart';
import 'package:taswaq/core/di/dependency_injuction.dart';
import 'package:taswaq/core/services/firebase_auth_service.dart';

class ProfileRemoteSource {
  final FirebaseAuthService _firebaseAuthService;

  ProfileRemoteSource(this._firebaseAuthService);
  Future<void> logout() async {
    await _firebaseAuthService.signOut();
  }

  Future<void> checkPass({required String oldPassword}) async {
    await _firebaseAuthService.reAuthanticateUser(
      email: getIt<CacheHelper>().getData(key: ApiKey.email),
      password: oldPassword,
    );
  }

  Future<void> updatePass({required String newPassword}) async {
    await _firebaseAuthService.changeUserPassword(newPassword: newPassword);
  }
}
