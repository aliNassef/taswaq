import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class ChossingCaseItem extends StatelessWidget {
  const ChossingCaseItem({
    super.key,
    required this.text,
    required this.isSelected,
    this.onTap,
  });
  final String text;
  final bool isSelected;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            color: isSelected ? AppColors.blackColor : AppColors.gray50Color,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              text,
              style: AppStyles.textStyle14SB.copyWith(
                color: isSelected ? Colors.white : AppColors.blackColor,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
