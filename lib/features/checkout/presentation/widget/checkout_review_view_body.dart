import 'package:flutter/material.dart';
import 'package:taswaq/core/shared/widgets/default_app_button.dart';
import 'package:taswaq/core/shared/widgets/spacers.dart';
import 'package:taswaq/features/checkout/presentation/widget/review_row_item.dart';

import '../../../../core/shared/widgets/constants.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class CheckoutReviewViewBody extends StatelessWidget {
  const CheckoutReviewViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHorizantalpadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text(
                'Items (2)',
                style: AppStyles.textStyle14M.copyWith(
                  color: AppColors.blackColor,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios_rounded,
                size: 24,
              ),
            ),
            const VerticalSpace(16),
            Text(
              'Shipping',
              style: AppStyles.textStyle16M.copyWith(
                color: AppColors.blackColor,
              ),
            ),
            const VerticalSpace(12),
            const ReviewRowItem(
              title: 'Full Name',
              value: 'ALi Nassef',
            ),
            const ReviewRowItem(
              title: 'Mobile Number',
              value: 'ALi Nassef',
            ),
            const ReviewRowItem(
              title: 'City',
              value: 'ALi Nassef',
            ),
            const ReviewRowItem(
              title: 'Street Address',
              value: 'ALi Nassef',
            ),
            const ReviewRowItem(
              title: 'Postal Code',
              value: 'ALi Nassef',
            ),
            const VerticalSpace(16),
            Text(
              'Order Info',
              style: AppStyles.textStyle16M.copyWith(
                color: AppColors.blackColor,
              ),
            ),
            const VerticalSpace(12),
            const ReviewRowItem(
              title: 'Total',
              value: 'ALi Nassef',
            ),
            const ReviewRowItem(
              title: 'Shipping Cost',
              value: 'ALi Nassef',
            ),
            const VerticalSpace(41),
            DefaultAppButton(
              text: 'Place Order',
              backgroundColor: AppColors.blackColor,
              textColor: Colors.white,
              onPressed: () {},
              padding: 0,
            )
          ],
        ),
      ),
    );
  }
}
