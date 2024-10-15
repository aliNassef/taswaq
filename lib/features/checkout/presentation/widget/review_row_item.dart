import 'package:flutter/material.dart';
import 'package:taswaq/core/utils/app_colors.dart';
import 'package:taswaq/core/utils/app_styles.dart';

class ReviewRowItem extends StatelessWidget {
  const ReviewRowItem({
    super.key,
    required this.title,
    required this.value,
  });
  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: AppStyles.textStyle12R.copyWith(
            color: AppColors.gray150Color,
          ),
        ),
        Text(
          value,
          style: AppStyles.textStyle12R.copyWith(
            color: AppColors.gray150Color,
          ),
        ),
      ],
    );
  }
}
