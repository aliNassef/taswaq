import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/app_styles.dart';

class CustomDropDown extends StatelessWidget {
  const CustomDropDown(
      {super.key,
      required this.title,
      this.items,
      this.onChanged,
      this.onSaved});
  final String title;
  final List<DropdownMenuItem<String>>? items;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSaved;
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2<String>(
      isExpanded: true,
      decoration: InputDecoration(
        hintStyle: AppStyles.textStyle12R.copyWith(
          color: AppColors.blackColor,
        ),
        fillColor: Colors.white,
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 16),
        border: buildBorderDropDown(),
        enabledBorder: buildBorderDropDown(),
        focusedBorder: buildBorderDropDown(),
      ),
      hint: Text(
        title,
        style: AppStyles.textStyle12R,
      ),
      items: items,
      validator: (value) {
        return null;
      },
      onChanged: onChanged,
      onSaved: onSaved,
      buttonStyleData: ButtonStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        padding: EdgeInsets.only(right: 8.w),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(
          Icons.arrow_drop_down,
          color: Colors.black45,
        ),
        iconSize: 24,
      ),
      dropdownStyleData: DropdownStyleData(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: AppColors.gray50Color,
          ),
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16),
      ),
    );
  }

  OutlineInputBorder buildBorderDropDown() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: const BorderSide(
        color: AppColors.gray50Color,
      ),
    );
  }
}
