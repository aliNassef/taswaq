import '../models/user_model.dart';

import '../../../../core/services/firebase_auth_service.dart';

class SignupRemoteSource {
  final FirebaseAuthService firebaseAuthService;
  const SignupRemoteSource({required this.firebaseAuthService});

  Future<UserModel> signup({
    required String email,
    required String password,
  }) async {
    final response = await firebaseAuthService.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return UserModel.fromJson(response);
  }
}
