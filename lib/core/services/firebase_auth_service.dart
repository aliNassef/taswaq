import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';

import '../errors/exceptions.dart';

class FirebaseAuthService {
  Future<User> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()} and code is ${e.code}");
      if (e.code == 'weak-password') {
        throw CustomException(errorMessage: 'password is too weak');
      } else if (e.code == 'email-already-in-use') {
        throw CustomException(
            errorMessage: 'the account already exists for that email');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(errorMessage: 'check internet connection');
      } else {
        throw CustomException(
            errorMessage:
                'there is something wrong with your email, try again');
      }
    } catch (e) {
      log("Exception in FirebaseAuthService.createUserWithEmailAndPassword: ${e.toString()}");
      throw CustomException(
          errorMessage: 'there is something wrong with your email, try again');
    }
  }

  Future<User> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      return credential.user!;
    } on FirebaseAuthException catch (e) {
      log("Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()} and code is ${e.code}");
      if (e.code == 'user-not-found') {
        throw CustomException(errorMessage: 'user not found');
      } else if (e.code == 'wrong-password') {
        throw CustomException(errorMessage: 'wrong password');
      } else if (e.code == 'network-request-failed') {
        throw CustomException(errorMessage: 'check internet connection');
      } else {
        throw CustomException(
            errorMessage:
                'there is something wrong with your email, try again');
      }
    } catch (e) {
      log("Exception in FirebaseAuthService.signInWithEmailAndPassword: ${e.toString()}");
      throw CustomException(
          errorMessage: 'there is something wrong with your email, try again');
    }
  }
}
