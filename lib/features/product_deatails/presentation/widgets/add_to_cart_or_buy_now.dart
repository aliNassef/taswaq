 import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taswaq/core/cache/cache_helper.dart';
import 'package:taswaq/core/di/dependency_injuction.dart';
import 'package:taswaq/core/services/firestore_database.dart';
import 'package:taswaq/core/shared/widgets/spacers.dart';
import 'package:taswaq/core/utils/app_colors.dart';
import 'package:taswaq/core/utils/app_images.dart';
 import 'package:taswaq/features/product_deatails/domain/entity/product_detais_entity/product_details_entity.dart';

import '../../../../core/shared/widgets/default_app_button.dart';

class AddToCartOrBuyNow extends StatelessWidget {
  const AddToCartOrBuyNow({
    super.key,
    required this.instance,
  });
  final ProductDetailsEntity instance;
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
            onPressed: () async {
              await FirestoreDatabase().addData(path: 'carts', data: {
                'userId': getIt<CacheHelper>().getData(key: 'userId'),
                'productId': instance.id,
                'quantity': 1,
                'price': instance.price,
                'title': instance.title,
                'image': instance.images![0],
                "discountPercentage": instance.discountPercentage,
              });
            },
          ),
        ),
      ],
    );
  }
}
