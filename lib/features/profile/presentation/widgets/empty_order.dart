import 'package:flutter/material.dart';

import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class EmptyOrder extends StatelessWidget {
  const EmptyOrder({
    super.key,
    required this.title,
    required this.description,
  });
  final String title, description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          title,
          style: AppStyles.textStyle24B.copyWith(
            color: AppColors.blackColor,
          ),
        ),
        const VerticalSpace(16),
        Text(
          description,
          style: AppStyles.textStyle14R.copyWith(color: AppColors.gray150Color),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
