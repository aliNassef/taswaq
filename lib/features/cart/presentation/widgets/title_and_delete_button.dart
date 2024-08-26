
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taswaq/core/utils/app_colors.dart';
import 'package:taswaq/core/utils/app_images.dart';
import 'package:taswaq/core/utils/app_styles.dart';

class CartItemTitleAndDeleteButton extends StatelessWidget {
  const CartItemTitleAndDeleteButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            'Loop Silicone Strong Magnetic Watch',
            style: AppStyles.textStyle14M.copyWith(
              color: AppColors.blackColor,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: SvgPicture.asset(
            AppSvgs.trashIcon,
          ),
        ),
      ],
    );
  }
}
