import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/shared/widgets/constants.dart';

import '../../../../core/di/dependency_injuction.dart';
import '../../../../core/shared/functions/build_error_message.dart';
import '../../../../core/shared/widgets/custom_text_form_field.dart';
import '../../../../core/shared/widgets/default_app_button.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../domain/repo/profile_repo.dart';
import '../manger/profile_cubit/profile_cubit.dart';
import '../widgets/profile_form.dart';

class NewPassView extends StatelessWidget {
  const NewPassView({super.key});
  static const routeName = '/newPassView';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(getIt<ProfileRepo>()),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar: buildChangePassAppBar(),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VerticalSpace(12),
                Text(
                  'New Password',
                  style: AppStyles.textStyle24B,
                ),
                Text(
                  'Enter your new password and remember it.',
                  style: AppStyles.textStyle14R
                      .copyWith(color: AppColors.gray150Color),
                ),
                const VerticalSpace(16),
                const ProfileForm(
                  title: 'Password ',
                ),
                const VerticalSpace(8),
                CustomTextFormField(
                  isPassword: true,
                  hintText: 'Enter your password',
                  controller: context.read<ProfileCubit>().newPassController,
                ),
                const VerticalSpace(16),
                const ProfileForm(
                  title: 'Confirm Password ',
                ),
                const VerticalSpace(8),
                CustomTextFormField(
                  isPassword: true,
                  hintText: 'Enter your password',
                  controller:
                      context.read<ProfileCubit>().confirmNewPassController,
                ),
                const VerticalSpace(24),
                BlocListener<ProfileCubit, ProfileState>(
                  listenWhen: (previous, current) =>
                      current is ProfileUpdatePasswordSuccess ||
                      current is ProfileUpdatePasswordFailure,
                  listener: (context, state) {
                    if (state is ProfileUpdatePasswordSuccess) {
                      Navigator.pop(context);
                    }
                    if (state is ProfileUpdatePasswordFailure) {
                      buildErrorMessage(context, errMessage: state.errMessage);
                    }
                  },
                  child: DefaultAppButton(
                    onPressed: () {
                      final cubit = context.read<ProfileCubit>();
                      if (cubit.confirmNewPassController.text ==
                          cubit.newPassController.text) {
                        cubit.updateUserPassword(
                          newPassword: cubit.newPassController.text.trim(),
                        );
                      } else {
                        buildErrorMessage(
                          context,
                          errMessage: 'Passwords don\'t match',
                        );
                      }
                    },
                    padding: 0,
                    text: 'Save',
                    backgroundColor: AppColors.blackColor,
                    textColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  AppBar buildChangePassAppBar() {
    return AppBar(
      title: Text(
        'Change Password',
        style: AppStyles.textStyle14M,
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      actions: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kHorizantalpadding.w),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '02/',
                  style: AppStyles.textStyle14SB
                      .copyWith(color: AppColors.blackColor),
                ),
                TextSpan(
                  text: '02',
                  style: AppStyles.textStyle14SB
                      .copyWith(color: AppColors.gray100Color),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
