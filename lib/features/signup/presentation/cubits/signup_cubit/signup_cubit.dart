import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:taswaq/core/api/end_ponits.dart';
import 'package:taswaq/core/cache/cache_helper.dart';
import 'package:taswaq/core/di/dependency_injuction.dart';
import 'package:taswaq/features/signup/domain/entity/user_entity.dart';
import 'package:taswaq/features/signup/domain/repo/signup_repo.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit(this._signupRepo) : super(SignupInitial());
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Future<void> close() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }

  final SignupRepo _signupRepo;
  Future<void> signUp() async {
    emit(SignupLoading());
    var result = await _signupRepo.signup(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
    );
    result.fold(
      (l) => emit(SignupFailure(errMessage: l.errMessage)),
      (r) {
        // name , id , email, image, token
        saveUserInfo(r);

        emit(SignupSuccess());
      },
    );
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
}
