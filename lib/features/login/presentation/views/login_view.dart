import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taswaq/core/di/dependency_injuction.dart';
import 'package:taswaq/features/login/domain/repo/login_repo.dart';
import 'package:taswaq/features/login/presentation/cubit/login_cubit/login_cubit.dart';
import 'package:taswaq/features/login/presentation/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});
  static const String routeName = 'login';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => LoginCubit(
          getIt<LoginRepo>(),
        ),
        child: const SafeArea(
          child: LoginViewBody(),
        ),
      ),
    );
  }
}
