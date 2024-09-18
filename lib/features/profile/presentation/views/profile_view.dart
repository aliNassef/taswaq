import 'package:flutter/material.dart';
import 'package:taswaq/features/profile/presentation/widgets/profile_view_body.dart';
import '../../../../core/utils/app_colors.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        bottom: false,
        child: ProfileViewBody(),
      ),
    );
  }
}
