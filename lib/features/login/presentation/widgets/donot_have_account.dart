import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:taswaq/core/shared/widgets/constants.dart';
import 'package:taswaq/core/utils/app_colors.dart';
import 'package:taswaq/core/utils/app_styles.dart';
import 'package:taswaq/features/signup/presentation/views/signup_view.dart';

class DonotHaveAccount extends StatelessWidget {
  const DonotHaveAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizantalpadding),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'Don’t have an account? ',
              style: AppStyles.textStyle14R.copyWith(
                color: AppColors.gray150Color,
              ),
            ),
            TextSpan(
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.of(context).pushNamed(SignupView.routeName);
                },
              text: 'Signup',
              style: AppStyles.textStyle14R.copyWith(
                color: AppColors.primaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
