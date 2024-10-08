import 'package:flutter/material.dart';

import '../../../../core/shared/widgets/spacers.dart';
import 'order_item.dart';

class OrdderListItems extends StatelessWidget {
  const OrdderListItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) => const OrderItem(),
        separatorBuilder: (context, index) => const VerticalSpace(16),
        itemCount: 10,
      ),
    );
  }
}
