import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taswaq/features/profile/presentation/manger/profile_cubit/profile_cubit.dart';
import 'package:taswaq/features/profile/presentation/widgets/profile_view_body.dart';
import '../../../../core/di/dependency_injuction.dart';
import '../../../../core/utils/app_colors.dart';
import '../../domain/repo/profile_repo.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: BlocProvider(
        create: (context) => ProfileCubit(
          getIt<ProfileRepo>(),
        ),
        child: const SafeArea(
          bottom: false,
          child: ProfileViewBody(),
        ),
      ),
    );
  }
}
