import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taswaq/core/shared/widgets/constants.dart';
import 'package:taswaq/core/shared/widgets/custom_text_form_field.dart';
import 'package:taswaq/core/shared/widgets/default_app_button.dart';
import 'package:taswaq/core/shared/widgets/spacers.dart';
import 'package:taswaq/core/utils/app_colors.dart';
import 'package:taswaq/core/utils/app_images.dart';
import 'package:taswaq/core/utils/app_styles.dart';
import 'package:taswaq/features/signup/presentation/widgets/have_accoount.dart';
import 'package:taswaq/features/signup/presentation/widgets/signup_form.dart';
import 'package:taswaq/features/signup/presentation/widgets/signup_form_title.dart';
import 'package:taswaq/features/signup/presentation/widgets/signup_with_google.dart';

class SignupViewBody extends StatelessWidget {
  const SignupViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: kHorizantalpadding),
            child: Text(
              'Signup',
              style: AppStyles.textStyle24B.copyWith(
                color: AppColors.blackColor,
              ),
            ),
          ),
          const VerticalSpace(8),
          const HaveAccount(),
          const VerticalSpace(32),
          const SignupForm(),
          const VerticalSpace(24),
          const DefaultAppButton(
            text: 'Create Account',
            backgroundColor: AppColors.blackColor,
            textColor: Colors.white,
          ),
          const VerticalSpace(24),
          const SignUpWithGoogle(),
        ],
      ),
    );
  }
}
