import 'package:flutter/material.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

void buildErrorMessage(BuildContext context,
    {required String errMessage, int secondes = 4}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.primaryColor,
      duration: Duration(seconds: secondes),
      content: Text(
        errMessage,
        style: AppStyles.textStyle14R.copyWith(color: Colors.white),
      ),
    ),
  );
}
