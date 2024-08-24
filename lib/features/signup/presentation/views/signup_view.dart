import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taswaq/core/di/dependency_injuction.dart';
import 'package:taswaq/features/signup/domain/repo/signup_repo.dart';
import 'package:taswaq/features/signup/presentation/cubits/signup_cubit/signup_cubit.dart';

import '../widgets/signup_view_body.dart';

class SignupView extends StatelessWidget {
  const SignupView({super.key});
  static const routeName = '/signup';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => SignupCubit(
          getIt<SignupRepo>(),
        ),
        child: const SafeArea(
          child: SignupViewBody(),
        ),
      ),
    );
  }
}
