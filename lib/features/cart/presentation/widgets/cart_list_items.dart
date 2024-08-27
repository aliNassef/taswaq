import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taswaq/core/shared/widgets/default_app_button.dart';
import 'package:taswaq/core/shared/widgets/spacers.dart';
import 'package:taswaq/core/utils/app_colors.dart';
import 'package:taswaq/core/utils/app_images.dart';
import 'package:taswaq/core/utils/app_styles.dart';
import 'package:taswaq/features/cart/domain/entities/cart_entity.dart';
import 'package:taswaq/features/cart/presentation/widgets/cart_item.dart';

class CartListItems extends StatelessWidget {
  const CartListItems({super.key, required this.carts});
  final List<CartEntity> carts;
  @override
  Widget build(BuildContext context) {
    return carts.isEmpty
        ? Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  AppImages.noCartItems,
                  fit: BoxFit.cover,
                ),
                Text(
                  'Your cart is empty',
                  style: AppStyles.textStyle24B.copyWith(
                    color: AppColors.blackColor,
                  ),
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Looks like you have not added anything in your cart. Go ahead and explore top categories.',
                  style: AppStyles.textStyle14R.copyWith(
                    color: AppColors.gray150Color,
                  ),
                  textAlign: TextAlign.center,
                ),
                const VerticalSpace(24),
                DefaultAppButton(
                  padding: 0,
                  onPressed: () {},
                  text: 'Explore Products',
                  backgroundColor: AppColors.blackColor,
                  textColor: Colors.white,
                )
              ],
            ),
          )
        : Expanded(
            child: ListView.separated(
              itemCount: carts.isEmpty ? 0 : carts.first.products?.length ?? 0,
              itemBuilder: (context, index) {
                final cartProduct = carts.first.products![index];
                return CartItem(
                  cart: cartProduct,
                );
              },
              separatorBuilder: (context, index) {
                return const VerticalSpace(16);
              },
            ),
          );
  }
}
