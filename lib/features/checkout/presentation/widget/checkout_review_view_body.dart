import 'package:flutter/material.dart';
import 'package:taswaq/core/shared/widgets/default_app_button.dart';
import 'package:taswaq/core/shared/widgets/spacers.dart';
import 'package:taswaq/features/checkout/presentation/view/preview_item_view.dart';
import 'package:taswaq/features/checkout/presentation/widget/review_row_item.dart';

import '../../../../core/shared/widgets/constants.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../view/order_placced_successfuly_view.dart';
import 'custom_stepper.dart';

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
          mainAxisSize: MainAxisSize.max,
          children: [
            const CustomStepper(),
            ListTile(
              contentPadding: EdgeInsets.zero,
              onTap: () {
                Navigator.pushNamed(context, PreviewItemView.routeName);
              },
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
            const Divider(),
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
            const VerticalSpace(12),
            const ReviewRowItem(
              title: 'Mobile Number',
              value: 'ALi Nassef',
            ),
            const VerticalSpace(12),
            const ReviewRowItem(
              title: 'City',
              value: 'ALi Nassef',
            ),
            const VerticalSpace(12),
            const ReviewRowItem(
              title: 'Street Address',
              value: 'ALi Nassef',
            ),
            const VerticalSpace(12),
            const ReviewRowItem(
              title: 'Postal Code',
              value: 'ALi Nassef',
            ),
            const Divider(),
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
            const VerticalSpace(12),
            const ReviewRowItem(
              title: 'Shipping Cost',
              value: 'ALi Nassef',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .2,
            ),
            DefaultAppButton(
              text: 'Place Order',
              backgroundColor: AppColors.blackColor,
              textColor: Colors.white,
              onPressed: () {
                Navigator.pushNamed(context, OrderPlacedSuccessfuly.routeName);
              },
              padding: 0,
            )
          ],
        ),
      ),
    );
  }
}
