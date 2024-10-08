import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taswaq/core/shared/widgets/spacers.dart';
import '../../../../core/shared/widgets/constants.dart';
import '../../../../core/shared/widgets/default_app_button.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../manger/order_history_cubit/order_history_cubit.dart';
import '../manger/order_history_cubit/order_history_state.dart';
import '../widgets/chossing_case.dart';
import '../widgets/empty_order.dart';

class OrderHistoryViewBody extends StatelessWidget {
  const OrderHistoryViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderHistoryCubit, OrderHistoryState>(
      buildWhen: (previous, current) => current is OrderHistoryChangePage,
      listener: (context, state) {},
      builder: (context, state) {
        final cubit = context.read<OrderHistoryCubit>();
        return Padding(
          padding: EdgeInsets.symmetric(horizontal: kHorizantalpadding),
          child: Column(
            children: [
              const VerticalSpace(16),
              ChossingCase(
                page: cubit.currentPage,
              ),
              Image.asset(
                AppImages.orderHistory,
              ),
              const VerticalSpace(16),
              EmptyOrder(
                title: cubit.currentPage == 1
                    ? 'No ongoing order'
                    : 'No completed order',
                description: cubit.currentPage == 1
                    ? 'We currently don\'t have any active orders in progress. Feel free to explore our products and place a order.'
                    : 'We don\'t have any past orders that have been completed. Start shopping now and create your first order with us.',
              ),
              const VerticalSpace(24),
              const DefaultAppButton(
                text: 'View Products',
                backgroundColor: AppColors.blackColor,
                textColor: Colors.white,
                padding: 0,
              ),
            ],
          ),
        );
      },
    );
  }
}
/*
  not emmpty for order ongoing & completed
 extract to order history  view body 
 */