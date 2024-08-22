import 'package:flutter/material.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class TitleAndPriceRow extends StatelessWidget {
  const TitleAndPriceRow({
    super.key,
    required this.title,
    required this.price,
    required this.discountPercentage,
  });
  final String title;
  final double price;
  final double discountPercentage;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: AppStyles.textStyle18B.copyWith(
              color: AppColors.blackColor,
            ),
          ),
        ),
        const HorizantalSpace(13),
        Column(
          children: [
            Text(
              'EGP $price',
              style:
                  AppStyles.textStyle18B.copyWith(color: AppColors.blackColor),
            ),
            Text(
              'EGP ${(price / (1 - (discountPercentage / 100))).round()}',
              style: AppStyles.textStyle14R.copyWith(
                color: AppColors.gray150Color,
                decoration: TextDecoration.lineThrough,
                decorationColor: AppColors.gray150Color,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
