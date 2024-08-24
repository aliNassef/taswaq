import 'package:flutter/material.dart';
import 'package:taswaq/core/shared/widgets/constants.dart';
import 'package:taswaq/core/shared/widgets/spacers.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: kHorizantalpadding),
          child: Text(
            'Login',
            style: AppStyles.textStyle24B.copyWith(
              color: AppColors.blackColor,
            ),
          ),
        ),
        const VerticalSpace(8),
        const HaveAccount(),
        const VerticalSpace(32),
        const SignupForm(),
      ],
    );
  }
}
