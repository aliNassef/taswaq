import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/shared/functions/get_user_data.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../domain/entity/product_detais_entity/product_details_entity.dart';
import '../cubits/add_product_to_cart_cubit/add_product_to_cart_cubit.dart';

import '../../../../core/shared/functions/toast_dialog.dart';
import '../../../../core/shared/widgets/default_app_button.dart';

class AddToCartOrBuyNow extends StatelessWidget {
  const AddToCartOrBuyNow({
    super.key,
    required this.instance,
  });
  final ProductDetailsEntity instance;
  @override
  Widget build(BuildContext context) {
    return BlocListener<AddProductToCartCubit, AddProductToCartState>(
      listenWhen: (previous, current) =>
          current is AddProductToCartSuccess ||
          current is AddProductToCartFailure,
      listener: (context, state) {
        if (state is AddProductToCartSuccess) {
          showToast(
            text: 'Product added to cart successfully',
          );
        } else {
          showToast(
            text: 'Failed to add product to cart',
          );
        }
      },
      child: Row(
        children: [
          Expanded(
            child: DefaultAppButton(
              backgroundColor: Colors.white,
              text: 'Buy Now',
              textColor: AppColors.blackColor,
              onPressed: () {},
            ),
          ),
          const HorizantalSpace(12),
          Expanded(
            child: DefaultAppButton(
              backgroundColor: AppColors.blackColor,
              text: 'Add to Cart',
              icon: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: SvgPicture.asset(AppSvgs.shoppingCart),
              ),
              textColor: Colors.white,
              onPressed: () async {
                context.read<AddProductToCartCubit>().addProductToCart(
                      userId: getUserData().id!,
                      product: instance,
                    );
              },
            ),
          ),
        ],
      ),
    );
  }
}
