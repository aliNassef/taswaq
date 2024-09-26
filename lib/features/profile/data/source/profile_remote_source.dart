import 'package:taswaq/core/api/end_ponits.dart';
import 'package:taswaq/core/cache/cache_helper.dart';
import 'package:taswaq/core/di/dependency_injuction.dart';
import 'package:taswaq/core/services/firebase_auth_service.dart';

import '../../../../core/services/database_service.dart';
import '../model/privacy_model.dart';

class ProfileRemoteSource {
  final FirebaseAuthService firebaseAuthService;
  final DatabaseService databaseService;
  ProfileRemoteSource({
    required this.firebaseAuthService,
    required this.databaseService,
  });
  Future<void> logout() async {
    await firebaseAuthService.signOut();
  }

  Future<void> checkPass({required String oldPassword}) async {
    await firebaseAuthService.reAuthanticateUser(
      email: getIt<CacheHelper>().getData(key: ApiKey.email),
      password: oldPassword,
    );
  }

  Future<void> updatePass({required String newPassword}) async {
    await firebaseAuthService.changeUserPassword(newPassword: newPassword);
  }

  Future<PrivacyModel> getPrivacyData() async {
    final response = await databaseService.getData(
      path: EndPoints.privacyPolicy,
      docuementId: '1',
    );
    return PrivacyModel.fromMap(response);
  }
}
