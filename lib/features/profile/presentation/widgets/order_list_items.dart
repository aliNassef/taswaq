import 'package:flutter/material.dart';

import '../../../../core/shared/widgets/spacers.dart';
import '../../../cart/domain/entities/cart_entity.dart';
import 'order_item.dart';

class OrdderListItems extends StatelessWidget {
  const OrdderListItems({
    super.key,
    required this.currentPage,
    required this.completedOrders,
    required this.ongoingOrders,
  });
  final int currentPage;
  final List<CartEntity> completedOrders;
  final List<CartEntity> ongoingOrders;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => OrderItem(
          currentPage: currentPage,
          instance:
              currentPage == 1 ? ongoingOrders[index] : completedOrders[index],
        ),
        separatorBuilder: (context, index) => const VerticalSpace(16),
        itemCount:
            currentPage == 1 ? ongoingOrders.length : completedOrders.length,
      ),
    );
  }
}
