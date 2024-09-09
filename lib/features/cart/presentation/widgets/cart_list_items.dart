import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taswaq/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import '../../../../core/shared/widgets/default_app_button.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';
import '../../domain/entities/cart_entity.dart';
import 'cart_item.dart';

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
            child: Column(
              children: [
                Expanded(
                  child: ListView.separated(
                    itemCount: carts.length,
                    itemBuilder: (context, index) {
                      final cart = carts[index];
                      return CartItem(
                        instance: cart,
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const VerticalSpace(16);
                    },
                  ),
                ),
                const VerticalSpace(24),
                DefaultAppButton(
                  text:
                      'Checkout (${context.read<CartCubit>().total.round()} EGP)',
                  backgroundColor: AppColors.blackColor,
                  textColor: Colors.white,
                  padding: 0,
                ),
                const VerticalSpace(24),
              ],
            ),
          );
  }
}
