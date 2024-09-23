import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taswaq/core/shared/widgets/custom_text_form_field.dart';
import 'package:taswaq/core/shared/widgets/default_app_button.dart';
import 'package:taswaq/core/shared/widgets/spacers.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../widgets/change_pass_form.dart';

class ChangePassView extends StatelessWidget {
  const ChangePassView({super.key});
  static const routeName = '/changePass';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildChangePassAppBar(),
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
            const ChangePassForm(
              title: 'Password',
            ),
            const VerticalSpace(8),
            CustomTextFormField(
              isPassword: true,
              hintText: 'Enter your password',
              controller: TextEditingController(),
            ),
            const VerticalSpace(24),
            DefaultAppButton(
              onPressed: () {},
              padding: 0,
              text: 'Continue',
              backgroundColor: AppColors.blackColor,
              textColor: Colors.white,
            ),
          ],
        ),
      ),
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
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: '01/',
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
