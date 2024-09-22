import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../login/presentation/views/login_view.dart';
import '../manger/profile_cubit/profile_cubit.dart';

class LogoutDialog extends StatelessWidget {
  const LogoutDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ProfileCubit, ProfileState>(
      listener: (context, state) {
        Navigator.pushReplacementNamed(context, LoginView.routeName);
      },
      child: AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
        ),
        title: Text(
          'Do uou want to logout?',
          textAlign: TextAlign.center,
          style: AppStyles.textStyle14SB.copyWith(color: AppColors.blackColor),
        ),
        actions: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(color: AppColors.blackColor),
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  minimumSize: const Size(100, 40),
                ),
                onPressed: () {
                  Navigator.of(context).pop(false);
                },
                child: Text(
                  'cancel',
                  style: AppStyles.textStyle16SB
                      .copyWith(color: AppColors.blackColor),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: AppColors.blackColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16.0),
                  ),
                  minimumSize: const Size(100, 40),
                ),
                onPressed: () {
                  context.read<ProfileCubit>().logout();
                  Navigator.of(context).pop(true);
                },
                child: Text(
                  'confirm',
                  style: AppStyles.textStyle16SB.copyWith(color: Colors.white),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
