import 'package:flutter/material.dart';
import '../../domain/entity/faqs_entity.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class FaqsItem extends StatelessWidget {
  const FaqsItem({super.key, required this.instance});
  final FaqsEntity instance;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          instance.question,
          style: AppStyles.textStyle14M.copyWith(color: AppColors.blackColor),
        ),
        Text(
          instance.answer,
          style: AppStyles.textStyle14R.copyWith(color: AppColors.gray150Color),
        ),
      ],
    );
  }
}
