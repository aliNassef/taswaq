import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taswaq/features/cart/domain/entities/cart_entity.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/shared/widgets/default_app_button.dart';
import '../../../../core/utils/app_colors.dart';
import '../manger/order_history_cubit/order_history_cubit.dart';
import '../manger/order_history_cubit/order_history_state.dart';
import '../widgets/chossing_case.dart';
import 'empty_order.dart';
import 'order_item.dart';
import 'order_list_items.dart';

// ignore: must_be_immutable
class OrderHistoryViewBody extends StatelessWidget {
  OrderHistoryViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OrderHistoryCubit, OrderHistoryState>(
      buildWhen: (previous, current) =>
          current is OrderHistoryChangePage ||
          current is OrderHistoryLoading ||
          current is OrderHistorySuccess ||
          current is OrderHistoryFailure,
      listener: (context, state) {},
      builder: (context, state) {
        if (state is OrderHistoryFailure) {
          return const Center(
            child: Text('Failed to get orders'),
          );
        }
        if (state is OrderHistorySuccess) {
          final cubit = context.read<OrderHistoryCubit>();
          final orders = state.orderHistory;
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: kHorizantalpadding),
            child: Column(
              children: [
                const VerticalSpace(16),
                ChossingCase(
                  page: cubit.currentPage,
                ),
                const VerticalSpace(24),
                orders.orders.isNotEmpty
                    ? OrdderListItems(
                        orders: orders,
                      )
                    : Column(
                        children: [
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
                        ],
                      ),
                const DefaultAppButton(
                  text: 'View Products',
                  backgroundColor: AppColors.blackColor,
                  textColor: Colors.white,
                  padding: 0,
                ),
                const VerticalSpace(24),
              ],
            ),
          );
        }
        return Expanded(
          child: ListView.separated(
            itemBuilder: (context, index) => Skeletonizer(
              enabled: true,
              child: OrderItem(
                instance: dummyData[index],
              ),
            ),
            separatorBuilder: (context, index) => const VerticalSpace(16),
            itemCount: dummyData.length,
          ),
        );
      },
    );
  }

  List<CartEntity> dummyData = [
    CartEntity(
        title: 'title',
        image: 'https://picsum.photos/250?image=9',
        price: 0,
        quantity: 0,
        productId: 0,
        discountPercentage: 0),
    CartEntity(
        title: 'title',
        image: 'https://picsum.photos/250?image=9',
        price: 0,
        quantity: 0,
        productId: 0,
        discountPercentage: 0),
  ];
}
