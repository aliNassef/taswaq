import 'package:flutter/material.dart';
import '../../../../core/shared/widgets/constants.dart';
import '../../../../core/shared/widgets/custom_fav_icon.dart';

class ProductDetailsTopBar extends StatelessWidget {
  const ProductDetailsTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizantalpadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
          CustomFavIcon(
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
