

import 'package:flutter/material.dart';
import 'package:taswaq/core/utils/app_colors.dart';
import 'package:taswaq/core/utils/app_styles.dart';

class SignupFormTitle extends StatelessWidget {
  const SignupFormTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: title,
            style: AppStyles.textStyle14M.copyWith(color: AppColors.blackColor),
          ),
          TextSpan(
            text: '*',
            style: AppStyles.textStyle14M.copyWith(color: AppColors.redColor),
          ),
        ],
      ),
    );
  }
}
