import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taswaq/core/di/dependency_injuction.dart';
import 'package:taswaq/core/utils/app_colors.dart';
import 'package:taswaq/core/utils/app_styles.dart';
import 'package:taswaq/features/cart/domain/repo/cart_repo.dart';
import 'package:taswaq/features/cart/presentation/cubits/get_cart_itms_cubit/get_cart_items_cubit.dart';
import 'package:taswaq/features/cart/presentation/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static const routeName = 'CartView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCartAppBar(),
      body: BlocProvider(
        create: (context) => GetCartItemsCubit(
          getIt<CartRepo>(),
        )..getCartItems(id: '11'),
        child: const SafeArea(
          child: CartViewBody(),
        ),
      ),
    );
  }

  AppBar buildCartAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {},
        icon: const Icon(Icons.arrow_back_ios),
      ),
      title: Text(
        'My Cart',
        style: AppStyles.textStyle14M.copyWith(
          color: AppColors.blackColor,
        ),
      ),
    );
  }
}
