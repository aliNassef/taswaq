import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:taswaq/features/login/domain/repo/login_repo.dart';

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
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold(
      (l) => emit(LoginFailure(errMessage: l.errMessage)),
      (r) {
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
        emit(LoginSuccess());
      },
    );
  }
}
