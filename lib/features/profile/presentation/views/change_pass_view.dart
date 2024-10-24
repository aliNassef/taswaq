import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../core/shared/widgets/custom_text_form_field.dart';
import '../../../../core/shared/widgets/default_app_button.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/shared/widgets/title_form.dart';
import '../manger/profile_cubit/profile_cubit.dart';
import 'new_pass_view.dart';
import '../../../../core/di/dependency_injuction.dart';
import '../../../../core/shared/functions/build_error_message.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../domain/repo/profile_repo.dart';
 
class ChangePassView extends StatelessWidget {
  const ChangePassView({super.key});
  static const routeName = '/changePass';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(
        getIt<ProfileRepo>(),
      ),
      child: Builder(builder: (context) {
        return Scaffold(
          appBar:
              buildChangePassAppBar(title: 'Change Password', pageNum: '01'),
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const VerticalSpace(12),
                Text(
                  'Old Password',
                  style: AppStyles.textStyle24B,
                ),
                Text(
                  'Enter old password to change the password.',
                  style: AppStyles.textStyle14R
                      .copyWith(color: AppColors.gray150Color),
                ),
                const VerticalSpace(16),
                const TitleForm(
                  title: 'Password',
                ),
                const VerticalSpace(8),
                CustomTextFormField(
                  isPassword: true,
                  hintText: 'Enter your password',
                  controller: context.read<ProfileCubit>().oldPassController,
                ),
                const VerticalSpace(24),
                BlocListener<ProfileCubit, ProfileState>(
                  listenWhen: (previous, current) =>
                      current is ProfileCheckPassSuccess ||
                      current is ProfileCheckPassFailure,
                  listener: (context, state) {
                    if (state is ProfileCheckPassSuccess) {
                      Navigator.pushReplacementNamed(
                        context,
                        NewPassView.routeName,
                      );
                    }
                    if (state is ProfileCheckPassFailure) {
                      buildErrorMessage(context, errMessage: state.errMessage);
                    }
                  },
                  child: DefaultAppButton(
                    onPressed: () {
                      final cubit = context.read<ProfileCubit>();
                      // push if success
                      cubit.checkPass(
                        oldPassword: cubit.oldPassController.text.trim(),
                      );
                    },
                    padding: 0,
                    text: 'Continue',
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
}
