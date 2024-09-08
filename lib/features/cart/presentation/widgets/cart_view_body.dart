import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/shared/widgets/constants.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../cubits/cart_cubit/cart_cubit.dart';
import 'cart_list_items.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CartCubit, CartState>(
      buildWhen: (previous, current) =>
          current is GetCartItemsLoaded ||
          current is GetCartItemsFailure ||
          current is GetCartItemsLoading,
      builder: (context, state) {
        if (state is GetCartItemsFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        }
        if (state is GetCartItemsLoaded) {
          return Padding(
            padding: EdgeInsets.only(
                left: kHorizantalpadding,
                right: kHorizantalpadding,
                bottom: 30),
            child: Column(
              children: [
                const VerticalSpace(12),
                CartListItems(
                  carts: state.cartItems,
                ),
              ],
            ),
          );
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
