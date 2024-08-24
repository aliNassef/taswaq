import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:taswaq/core/api/end_ponits.dart';
import 'package:taswaq/core/cache/cache_helper.dart';
import 'package:taswaq/features/login/domain/repo/login_repo.dart';

import '../../../../../core/di/dependency_injuction.dart';
import '../../../domain/entity/user_entity.dart';

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
        // name , id , email, image, token
        saveUserInfo(r);
        emit(LoginSuccess());
      },
    );
  }
}

void saveUserInfo(UserEntity r) {
  getIt<CacheHelper>().saveData(
    key: ApiKey.username,
    value: r.firstName,
  );
  getIt<CacheHelper>().saveData(
    key: ApiKey.userId,
    value: r.id.toString(),
  );
  getIt<CacheHelper>().saveData(
    key: ApiKey.email,
    value: r.email,
  );
  getIt<CacheHelper>().saveData(
    key: ApiKey.token,
    value: r.token,
  );

  getIt<CacheHelper>().saveData(
    key: ApiKey.image,
    value: r.image,
  );
}
