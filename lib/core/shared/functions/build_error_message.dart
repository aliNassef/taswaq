import 'package:flutter/material.dart';
import 'package:taswaq/core/utils/app_colors.dart';
import 'package:taswaq/core/utils/app_styles.dart';

void buildErrorMessage(BuildContext context, {required String errMessage}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: AppColors.primaryColor,
      content: Text(
        errMessage,
        style: AppStyles.textStyle14R.copyWith(color: Colors.white),
      ),
    ),
  );
}
