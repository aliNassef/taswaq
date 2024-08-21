
import 'package:flutter/material.dart';
import 'package:taswaq/core/shared/widgets/spacers.dart';
import 'package:taswaq/core/utils/app_colors.dart';
import 'package:taswaq/core/utils/app_styles.dart';

class TitleAndPriceRow extends StatelessWidget {
  const TitleAndPriceRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            'Loop Silicone Strong Magnetic watch',
            style: AppStyles.textStyle18B.copyWith(
              color: AppColors.blackColor,
            ),
          ),
        ),
        const HorizantalSpace(13),
        Column(
          children: [
            Text(
              'EGP 120.00',
              style:
                  AppStyles.textStyle18B.copyWith(color: AppColors.blackColor),
            ),
            Text(
              'EGP 120.00',
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