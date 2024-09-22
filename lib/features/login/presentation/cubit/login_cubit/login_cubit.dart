import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../core/api/end_ponits.dart';
import '../../../../../core/di/dependency_injuction.dart';
import '../../../domain/entity/user_entity.dart';
import '../../../domain/repo/login_repo.dart';
import '../../../../../core/cache/cache_helper.dart';
part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit(this._loginRepo) : super(LoginInitial());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }

  final LoginRepo _loginRepo;
  Future<void> login() async {
    emit(LoginLoading());
    final result = await _loginRepo.login(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
    result.fold(
      (l) => emit(LoginFailure(errMessage: l.errMessage)),
      (r) {
        saveUserData(r);
        emit(LoginSuccess());
      },
    );
  }

  Future<void> loginWithGoogle() async {
    emit(LoginLoading());
    final result = await _loginRepo.loginWithGoogle();
    result.fold(
      (l) => emit(LoginFailure(errMessage: l.errMessage)),
      (r) {
        saveUserData(r);
        emit(LoginSuccess());
      },
    );
  }

  // need to refactor
  saveUserData(UserEntity user) {
    getIt<CacheHelper>().saveData(key: ApiKey.userId, value: user.id);
    getIt<CacheHelper>().saveData(key: ApiKey.email, value: user.email);
    getIt<CacheHelper>().saveData(key: ApiKey.name, value: user.name);
    getIt<CacheHelper>().saveData(key: ApiKey.isLoggedIn, value: true);
  }
}
