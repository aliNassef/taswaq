import 'package:firebase_auth/firebase_auth.dart';
import 'package:taswaq/core/services/firebase_auth_service.dart';

import '../models/user_model.dart';

class LoginRemoteSource {
  final FirebaseAuthService firebaseAuthService;
  const LoginRemoteSource({required this.firebaseAuthService});

  Future<UserModel> login(
      {required String email, required String password}) async {
    final user = await firebaseAuthService.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return UserModel.fromJson(user);
  }

  Future<UserModel> loginWithGoogle() async {
    final user = await firebaseAuthService.signInWithGoogle();
    return UserModel.fromJson(user.user!);
  }
}
