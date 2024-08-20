import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../domain/entities/product_entity/product_entity.dart';

class ProductGridItem extends StatelessWidget {
  const ProductGridItem({
    super.key,
    required this.product,
  });
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            product.thumbnail!,
            height: 138.h,
            width: double.infinity,
            fit: BoxFit.fill,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            product.title!,
            style: AppStyles.textStyle14M.copyWith(
              overflow: TextOverflow.ellipsis,
              color: AppColors.blackColor,
            ),
            textAlign: TextAlign.start,
          ),
        ),
      ],
    );
  }
}
