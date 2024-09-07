import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taswaq/core/shared/widgets/spacers.dart';
import 'package:taswaq/core/utils/app_colors.dart';
import 'package:taswaq/core/utils/app_styles.dart';
import 'package:taswaq/features/cart/presentation/widgets/title_and_delete_button.dart';
import 'package:taswaq/features/product_deatails/presentation/widgets/counter_widget.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            ' cart.thumbnail!',
            width: 120.w,
            height: 120.h,
            fit: BoxFit.fill,
          ),
        ),
        const HorizantalSpace(8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const CartItemTitleAndDeleteButton(
                discountPercentage: 0,
                price: 0,
                title: 'cart.title!',
              ),
              Text(
                '\${cart.price}',
                style: AppStyles.textStyle12SB
                    .copyWith(color: AppColors.blackColor),
              ),
              Text(
                '\${(cart.price! / (1 - (cart.discountPercentage! / 100))).round()}',
                style: AppStyles.textStyle10R.copyWith(
                  decoration: TextDecoration.lineThrough,
                  decorationColor: AppColors.gray150Color,
                  color: AppColors.gray150Color,
                ),
              ),
              const VerticalSpace(6),
              CounterWidget(
                quantity: 1,
                decrement: () {},
                increment: () {},
              ),
            ],
          ),
        ),
      ],
    );
  }
}
