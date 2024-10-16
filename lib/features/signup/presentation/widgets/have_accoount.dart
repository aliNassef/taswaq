import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../login/presentation/views/login_view.dart';

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
              recognizer: TapGestureRecognizer()
                ..onTap = () {
                  Navigator.pushNamed(context, LoginView.routeName);
                },
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
