import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class TermsCondationItem extends StatelessWidget {
  const TermsCondationItem(
      {super.key, required this.title, required this.description});
  final String title;
  final String description;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppStyles.textStyle14M,
        ),
        Text(
          description,
          style: AppStyles.textStyle14M.copyWith(
            color: AppColors.gray150Color,
          ),
        ),
      ],
    );
  }
}
