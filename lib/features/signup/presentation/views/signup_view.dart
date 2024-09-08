import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/dependency_injuction.dart';
import '../../domain/repo/signup_repo.dart';
import '../cubits/signup_cubit/signup_cubit.dart';

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
