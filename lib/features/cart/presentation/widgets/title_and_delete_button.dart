import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taswaq/core/utils/app_colors.dart';
import 'package:taswaq/core/utils/app_images.dart';
import 'package:taswaq/core/utils/app_styles.dart';

class CartItemTitleAndDeleteButton extends StatelessWidget {
  const CartItemTitleAndDeleteButton({
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
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            title,
            style: AppStyles.textStyle14M.copyWith(
              color: AppColors.blackColor,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 2,
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
