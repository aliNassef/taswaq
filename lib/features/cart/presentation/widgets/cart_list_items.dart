
import 'package:flutter/material.dart';
import 'package:taswaq/core/shared/widgets/spacers.dart';
import 'package:taswaq/features/cart/domain/entities/cart_entity.dart';
import 'package:taswaq/features/cart/presentation/widgets/cart_item.dart';

class CartListItems extends StatelessWidget {
  const CartListItems({super.key, required this.carts});
  final List<CartEntity> carts;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemBuilder: (context, index) {
          final cartProduct = carts[0].products![index];
          return CartItem(
            cart: cartProduct,
          );
        },
        itemCount: carts[0].products!.length,
        separatorBuilder: (context, index) {
          return const VerticalSpace(16);
        },
      ),
    );
  }
}
