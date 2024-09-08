import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';
import '../cubits/cart_cubit/cart_cubit.dart';

class CartItemTitleAndDeleteButton extends StatelessWidget {
  const CartItemTitleAndDeleteButton({
    super.key,
    required this.title,
    required this.price,
    required this.discountPercentage,
    required this.productId,
  });
  final String title;
  final double price;
  final double discountPercentage;
  final String productId;
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
          onTap: () {
            context.read<CartCubit>().deleteCartItem(id: productId);
          },
          child: SvgPicture.asset(
            AppSvgs.trashIcon,
          ),
        ),
      ],
    );
  }
}
