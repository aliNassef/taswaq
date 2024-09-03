import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
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
        emit(SignupSuccess());
      },
    );
  }
}
