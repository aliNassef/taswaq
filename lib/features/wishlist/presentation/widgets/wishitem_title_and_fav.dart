import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/shared/widgets/custom_fav_icon.dart';
import '../../../../core/utils/app_colors.dart';
import '../cubit/wish_list_cubit.dart';

import '../../../../core/utils/app_styles.dart';

class WishItemTitleAndFavButton extends StatelessWidget {
  const WishItemTitleAndFavButton(
      {super.key, required this.title, required this.productId});
  final String title;
  final int productId;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Text(
            title,
            style: AppStyles.textStyle14M.copyWith(
              color: AppColors.blackColor,
              overflow: TextOverflow.ellipsis,
            ),
            maxLines: 2,
          ),
        ),
        GestureDetector(
          onTap: () {
            context
                .read<WishListCubit>()
                .deleteProductFromWishList(id: productId.toString());
          },
          child: const CustomFavIcon(
            isFav: true,
          ),
        ),
      ],
    );
  }
}
