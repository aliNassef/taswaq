import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taswaq/core/shared/widgets/custom_fav_icon.dart';
import '../../../product_deatails/presentation/views/product_details_view.dart';
import '../../domain/entities/product_entity/product_entity.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({
    super.key,
    required this.instance,
  });
  final ProductEntity instance;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // pass id here

        Navigator.pushNamed(
          context,
          ProductDetailsView.routeName,
          arguments: instance.id,
        );
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.primaryColor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(24),
                  child: Image.network(
                    instance.thumbnail ?? '',
                    height: 138.h,
                    width: MediaQuery.sizeOf(context).width,
                    fit: BoxFit.fill,
                  ),
                ),
                Positioned(
                  top: 8.h,
                  right: 8.h,
                  child: const CustomFavIcon(),
                )
              ],
            ),
            Text(
              instance.title ?? '',
              style: AppStyles.textStyle14M.copyWith(
                color: AppColors.blackColor,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Text(
              '${instance.price!} EGP',
              style:
                  AppStyles.textStyle14M.copyWith(color: AppColors.blackColor),
            ),
            Text(
              '${(instance.price! / (1 - (instance.discountPercentage! / 100))).round()} EGP',
              style: AppStyles.textStyle12R.copyWith(
                color: AppColors.grayColor,
                decoration: TextDecoration.lineThrough,
                decorationThickness: 2,
                decorationColor: AppColors.grayColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
