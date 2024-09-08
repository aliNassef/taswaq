import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taswaq/core/shared/widgets/spacers.dart';
import 'package:taswaq/core/utils/app_colors.dart';
import 'package:taswaq/core/utils/app_styles.dart';
import 'package:taswaq/features/cart/domain/entities/cart_entity.dart';
import 'package:taswaq/features/cart/presentation/widgets/title_and_delete_button.dart';
import 'package:taswaq/features/product_deatails/presentation/widgets/counter_widget.dart';

class CartItem extends StatelessWidget {
  const CartItem({
    super.key,
    required this.instance,
  });
  final CartEntity instance;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Image.network(
            instance.image,
            width: 120.w,
            height: 120.h,
            fit: BoxFit.fill,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return SizedBox(
                width: 120.w,
                height: 120.h,
                child: Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                ),
              );
            },
          ),
        ),
        const HorizantalSpace(8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CartItemTitleAndDeleteButton(
                productId: instance.productId.toString(),
                discountPercentage: instance.discountPercentage,
                price: instance.price,
                title: instance.title,
              ),
              Text(
                '\$${instance.price}',
                style: AppStyles.textStyle12SB
                    .copyWith(color: AppColors.blackColor),
              ),
              Text(
                '\$${(instance.price / (1 - (instance.discountPercentage / 100))).round()}',
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
