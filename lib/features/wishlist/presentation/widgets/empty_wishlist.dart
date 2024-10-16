import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/constants.dart';
import '../../../../core/shared/widgets/default_app_button.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';
import '../cubit/wish_list_cubit.dart';

class EmptyWishList extends StatelessWidget {
  const EmptyWishList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Colors.white,
      backgroundColor: Colors.black,
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      onRefresh: () async {
        await context.read<WishListCubit>().getWishListData();
      },
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kHorizantalpadding),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                AppImages.wishlistEmpty,
                height: MediaQuery.sizeOf(context).height * .3,
                width: double.infinity,
              ),
              Text(
                'Your wishlist is empty',
                style: AppStyles.textStyle24B.copyWith(
                  color: AppColors.blackColor,
                ),
              ),
              const VerticalSpace(16),
              Text(
                'Tap heart button to start saving your favorite items.',
                style: AppStyles.textStyle14R
                    .copyWith(color: AppColors.gray150Color),
                textAlign: TextAlign.center,
              ),
              const VerticalSpace(16),
              const DefaultAppButton(
                text: 'Express Products',
                backgroundColor: AppColors.blackColor,
                textColor: Colors.white,
                padding: 0,
              ),
              const VerticalSpace(50),
            ],
          ),
        ),
      ),
    );
  }
}
