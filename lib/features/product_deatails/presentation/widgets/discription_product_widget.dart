
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:taswaq/core/utils/app_colors.dart';
import 'package:taswaq/core/utils/app_styles.dart';
import 'package:taswaq/features/product_deatails/domain/entity/product_detais_entity/product_details_entity.dart';

class DescriptionProductWidget extends StatelessWidget {
  const DescriptionProductWidget({
    super.key,
    required this.instance,
  });

  final ProductDetailsEntity instance;

  @override
  Widget build(BuildContext context) {
    return ReadMoreText(
      instance.description!,
      trimMode: TrimMode.Line,
      trimLines: 3,
      style: AppStyles.textStyle14R.copyWith(
        color: AppColors.gray150Color,
      ),
      colorClickableText: AppColors.primaryColor,
      trimCollapsedText: 'Read more',
      trimExpandedText: 'Show less',
      moreStyle: AppStyles.textStyle14R.copyWith(
        color: AppColors.primaryColor,
      ),
    );
  }
}
