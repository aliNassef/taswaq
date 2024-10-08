import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: AppColors.redColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            'Estimated time: 7 working days',
            style: AppStyles.textStyle10SB.copyWith(
              color: Colors.white,
            ),
          ),
        ),
        const VerticalSpace(8),
        Row(
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Colors.amberAccent,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Image.asset(
                AppImages.orderHistory,
                height: 120.h,
                width: 120.w,
                fit: BoxFit.fill,
              ),
            ),
            const HorizantalSpace(8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'data',
                  style: AppStyles.textStyle14M.copyWith(
                    color: AppColors.blackColor,
                  ),
                ),
                Text(
                  'data',
                  style: AppStyles.textStyle12SB,
                ),
                Text(
                  'data',
                  style: AppStyles.textStyle10R.copyWith(
                    color: AppColors.gray150Color,
                    decoration: TextDecoration.lineThrough,
                    decorationThickness: 2,
                    decorationColor: AppColors.grayColor,
                  ),
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
