import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taswaq/core/shared/widgets/constants.dart';
import 'package:taswaq/core/shared/widgets/spacers.dart';
import 'package:taswaq/features/cart/presentation/cubits/get_cart_itms_cubit/get_cart_items_cubit.dart';
import 'package:taswaq/features/cart/presentation/widgets/cart_list_items.dart';

class CartViewBody extends StatelessWidget {
  const CartViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCartItemsCubit, GetCartItemsState>(
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
