import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../cart/domain/entities/cart_entity.dart';

import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class OrderItem extends StatelessWidget {
  const OrderItem(
      {super.key, required this.instance, required this.currentPage});
  final CartEntity instance;
  final int currentPage;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: BoxDecoration(
            color: currentPage == 1 ? AppColors.redColor : Colors.blue,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Text(
            currentPage == 1 ? 'Estimated time: 7 working days' : 'Finished',
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
                color: Colors.teal,
                borderRadius: BorderRadius.all(Radius.circular(12)),
              ),
              child: Image.network(
                instance.image,
                height: 120.h,
                width: 120.w,
                fit: BoxFit.fill,
              ),
            ),
            const HorizantalSpace(8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  instance.title,
                  style: AppStyles.textStyle14M.copyWith(
                    color: AppColors.blackColor,
                  ),
                ),
                Text(
                  '${instance.price} EGP',
                  style: AppStyles.textStyle12SB,
                ),
                Text(
                  '${(instance.price / (1 - (instance.discountPercentage / 100))).round()} EGP',
                  style: AppStyles.textStyle10R.copyWith(
                    color: AppColors.gray150Color,
                    decoration: TextDecoration.lineThrough,
                    decorationThickness: 2,
                    decorationColor: AppColors.grayColor,
                  ),
                ),
                Text(
                  'amount : ${instance.quantity}',
                  style: AppStyles.textStyle12SB,
                ),
              ],
            )
          ],
        ),
      ],
    );
  }
}
