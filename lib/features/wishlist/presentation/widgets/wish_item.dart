import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/shared/functions/toast_dialog.dart';
import '../cubit/wish_list_cubit.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../domain/entity/wishlisst_entity.dart';
import 'wish_item_image.dart';

import 'wishitem_title_and_fav.dart';

class WishItem extends StatelessWidget {
  const WishItem({super.key, required this.instance});
  final WishlistEntity instance;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        children: [
          WishItemImage(
            img: instance.image,
          ),
          const HorizantalSpace(8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                WishItemTitleAndFavButton(
                  productId: instance.productId,
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
                BlocListener<WishListCubit, WishListState>(
                  listenWhen: (previous, current) =>
                      current is AddedToCartState,
                  listener: (context, state) {
                    showToast(text: 'product added to cart successfully');
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        context
                            .read<WishListCubit>()
                            .addProductToCart(product: instance);
                      },
                      icon: const Icon(Icons.add_shopping_cart_sharp),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
