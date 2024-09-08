import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
    this.isPassword = false,
  });
  final String hintText;
  final TextEditingController controller;
  final bool isPassword;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  bool isSecure = false;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isSecure,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Field is required';
        }
        return null;
      },
      controller: widget.controller,
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(
          horizontal: 16.w,
          vertical: 22.5.h,
        ),
        hintText: widget.hintText,
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
        suffixIcon: widget.isPassword
            ? IconButton(
                onPressed: () {
                  setState(() {
                    isSecure = !isSecure;
                  });
                },
                icon: isSecure
                    ? const Icon(
                        Icons.visibility_off,
                        color: AppColors.blackColor,
                      )
                    : const Icon(
                        Icons.visibility_sharp,
                        color: AppColors.blackColor,
                      ),
              )
            : const SizedBox(),
      ),
    );
  }
}
