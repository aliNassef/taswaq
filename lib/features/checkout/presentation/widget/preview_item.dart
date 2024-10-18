

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/constants.dart';
import '../../../cart/domain/entities/cart_entity.dart';
import 'preview_item_image.dart';

class PreviewItem extends StatelessWidget {
  const PreviewItem({
    super.key,
    required this.product,
  });
  final CartEntity product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(horizontal: kHorizantalpadding, vertical: 10.h),
      child: Row(
        children: [
          PreviewItemImage(img: product.image),
          const HorizantalSpace(8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                 product.title,
                  style: AppStyles.textStyle14M.copyWith(
                    color: AppColors.blackColor,
                    overflow: TextOverflow.ellipsis,
                  ),
                  maxLines: 2,
                ),
                Text(
                  '${product.price} Egp',
                  style: AppStyles.textStyle12SB
                      .copyWith(color: AppColors.blackColor),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
