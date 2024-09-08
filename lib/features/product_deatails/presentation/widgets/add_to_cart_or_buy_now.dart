import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taswaq/core/api/end_ponits.dart';
import 'package:taswaq/core/cache/cache_helper.dart';
import 'package:taswaq/core/di/dependency_injuction.dart';
import 'package:taswaq/core/shared/widgets/spacers.dart';
import 'package:taswaq/core/utils/app_colors.dart';
import 'package:taswaq/core/utils/app_images.dart';
import 'package:taswaq/features/product_deatails/domain/entity/product_detais_entity/product_details_entity.dart';
import 'package:taswaq/features/product_deatails/presentation/cubits/add_product_to_cart_cubit/add_product_to_cart_cubit.dart';

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
                      userId: getIt<CacheHelper>().getData(key: ApiKey.userId),
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
