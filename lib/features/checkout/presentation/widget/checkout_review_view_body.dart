import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taswaq/core/shared/functions/get_user_data.dart';
import 'package:taswaq/core/shared/functions/toast_dialog.dart';
import 'package:taswaq/core/shared/widgets/default_app_button.dart';
import 'package:taswaq/core/shared/widgets/spacers.dart';
import 'package:taswaq/features/checkout/domain/entity/order_entity.dart';
import 'package:taswaq/features/checkout/presentation/manger/cubit/checkout_cubit.dart';
import 'package:taswaq/features/checkout/presentation/manger/cubit/checkout_state.dart';
import 'package:taswaq/features/checkout/presentation/view/preview_item_view.dart';
import 'package:taswaq/features/checkout/presentation/widget/review_row_item.dart';
import '../../../../core/shared/functions/build_error_message.dart';
import '../../../../core/utils/constants.dart';
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
    return BlocBuilder<CheckoutCubit, CheckoutState>(
      buildWhen: (previous, current) => current != previous,
      builder: (context, state) {
        if (state.isLoading || state.isInitial) {
          return const Center(
            child: CircularProgressIndicator.adaptive(),
          );
        }
        if (state.isFailure) {
          return Center(
            child: Text(state.errMessage!),
          );
        }
        final address = state.address!;
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
                    'Items (${checkoutProducts.length})',
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
                ReviewRowItem(
                  title: 'Full Name',
                  value: address.name,
                ),
                const VerticalSpace(12),
                ReviewRowItem(
                  title: 'Mobile Number',
                  value: '0${address.phoneNumber}',
                ),
                const VerticalSpace(12),
                ReviewRowItem(
                  title: 'City',
                  value: address.city,
                ),
                const VerticalSpace(12),
                ReviewRowItem(
                  title: 'Street Address',
                  value: address.street,
                ),
                const VerticalSpace(12),
                ReviewRowItem(
                  title: 'Postal Code',
                  value: address.postalCode,
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
                ReviewRowItem(
                  title: 'Total',
                  value: '$total EGP',
                ),
                const VerticalSpace(12),
                const ReviewRowItem(
                  title: 'Shipping Cost',
                  value: '20 EGP',
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * .2,
                ),
                BlocListener<CheckoutCubit, CheckoutState>(
                  listenWhen: (previous, current) => current != previous,
                  listener: (context, state) {
                    if (state.isFailure) {
                      buildErrorMessage(context, errMessage: state.errMessage!);
                    }
                    if (state.isAddedOrderSuccess) {
                      Navigator.pushNamed(
                          context, OrderPlacedSuccessfuly.routeName);
                      showToast(text: 'Order Placed Successfully');
                    }
                  },
                  child: DefaultAppButton(
                    text: 'Place Order',
                    backgroundColor: AppColors.blackColor,
                    textColor: Colors.white,
                    onPressed: () {
                      final order = OrderEntity(
                        id: getUserData().id!,
                        orders: checkoutProducts,
                        isRecived: false,
                        address: address,
                        totalPrice: total,
                      );
                      context.read<CheckoutCubit>().addOrder(order: order);
                    },
                    padding: 0,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
