import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taswaq/core/shared/widgets/spacers.dart';
import 'package:taswaq/core/utils/app_colors.dart';
import 'package:taswaq/core/utils/app_images.dart';
import 'package:taswaq/features/cart/presentation/views/cart_view.dart';

import '../../../../core/shared/widgets/default_app_button.dart';

class AddToCartOrBuyNow extends StatelessWidget {
  const AddToCartOrBuyNow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
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
            onPressed: () {
              Navigator.pushNamed(context, CartView.routeName);
            },
          ),
        ),
      ],
    );
  }
}
