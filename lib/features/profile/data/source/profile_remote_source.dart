import '../../../../core/api/end_ponits.dart';
import '../../../../core/cache/cache_helper.dart';
import '../../../../core/di/dependency_injuction.dart';
import '../../../../core/services/firebase_auth_service.dart';
import '../../../../core/services/database_service.dart';
import '../model/privacy_model.dart';
import '../model/terms_model.dart';

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

  Future<TermsModel> getTermsData() async {
    final response = await databaseService.getData(
      path: EndPoints.termsCondations,
      docuementId: '1',
    );
    return TermsModel.fromMap(response);
  }

  Future<void> addUserAddress({required Map<String, dynamic> data}) async {
    await databaseService.addToSubCollection(
      path: EndPoints.users,
      subCollectionName: EndPoints.address,
      data: data,
      docId: getIt<CacheHelper>().getData(key: ApiKey.userId),
    );
  }
}
