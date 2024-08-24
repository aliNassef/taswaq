import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taswaq/core/utils/app_colors.dart';
import 'package:taswaq/core/utils/app_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField(
      {super.key,
      required this.hintText,
      required this.controller,
      this.isPassword = false});
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field is required';
        }
        return null;
      },
      controller: controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 22.5.h,
        ),
        hintText: hintText,
        hintStyle: AppStyles.textStyle12R.copyWith(
          color: AppColors.gray100Color,
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12),
          ),
          borderSide: BorderSide(
            color: AppColors.primaryColor,
          ),
        ),
        suffixIcon: isPassword
            ? const Icon(
                Icons.visibility_sharp,
                color: AppColors.blackColor,
              )
            : const SizedBox(),
      ),
    );
  }
}
