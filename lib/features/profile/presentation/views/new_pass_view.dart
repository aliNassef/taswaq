import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taswaq/core/shared/widgets/constants.dart';

import '../../../../core/shared/widgets/custom_text_form_field.dart';
import '../../../../core/shared/widgets/default_app_button.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../widgets/change_pass_form.dart';

class NewPassView extends StatelessWidget {
  const NewPassView({super.key});
  static const routeName = '/newPassView';
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
              'New Password',
              style: AppStyles.textStyle24B,
            ),
            Text(
              'Enter your new password and remember it.',
              style: AppStyles.textStyle14R
                  .copyWith(color: AppColors.gray150Color),
            ),
            const VerticalSpace(16),
            const ChangePassForm(
              title: 'Password ',
            ),
            const VerticalSpace(8),
            CustomTextFormField(
              isPassword: true,
              hintText: 'Enter your password',
              controller: TextEditingController(),
            ),
            const VerticalSpace(16),
            const ChangePassForm(
              title: 'Confirm Password ',
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
              text: 'Save',
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
