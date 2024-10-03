import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/dependency_injuction.dart';
import '../../../../core/shared/functions/get_user_data.dart';
import '../../domain/repo/cart_repo.dart';
import '../cubits/cart_cubit/cart_cubit.dart';
import '../widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static const routeName = 'CartView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => CartCubit(
          getIt<CartRepo>(),
        )..getCartItems(
            id: getUserData().id!,
          ),
        child: const SafeArea(
          bottom: false,
          child: CartViewBody(),
        ),
      ),
    );
  }
}
