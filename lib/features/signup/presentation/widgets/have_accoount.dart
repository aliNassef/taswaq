import 'package:flutter/material.dart';
import 'package:taswaq/core/shared/widgets/constants.dart';
import 'package:taswaq/core/utils/app_colors.dart';
import 'package:taswaq/core/utils/app_styles.dart';

class HaveAccount extends StatelessWidget {
  const HaveAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizantalpadding),
      child: Text.rich(
        TextSpan(
          children: [
            TextSpan(
              text: 'Already have an account? ',
              style: AppStyles.textStyle14R.copyWith(
                color: AppColors.gray150Color,
              ),
            ),
            TextSpan(
              text: 'Login',
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
