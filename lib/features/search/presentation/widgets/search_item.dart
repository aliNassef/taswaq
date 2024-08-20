import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../domain/entities/search_entity/search_entity.dart';

class SearchItem extends StatelessWidget {
  const SearchItem({
    super.key,
    required this.product,
  });

  final SearchEntity product;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.network(
          product.thumbnail!,
          height: 138.h,
          width: double.infinity,
        ),
        const VerticalSpace(8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              product.title!,
              style: AppStyles.textStyle14M.copyWith(
                color: AppColors.blackColor,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              '${product.price!} Egp',
              style: AppStyles.textStyle14SB,
              textAlign: TextAlign.start,
            ),
          ],
        ),
      ],
    );
  }
}
