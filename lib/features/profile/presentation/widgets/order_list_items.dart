import 'package:flutter/material.dart';
import 'package:taswaq/features/profile/domain/entity/order_entity.dart';

import '../../../../core/shared/widgets/spacers.dart';
import 'order_item.dart';

class OrdderListItems extends StatelessWidget {
  const OrdderListItems({super.key, required this.orders});
  final OrderEntity orders;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => OrderItem(
          instance: orders.orders[index],
        ),
        separatorBuilder: (context, index) => const VerticalSpace(16),
        itemCount: orders.orders.length,
      ),
    );
  }
}
