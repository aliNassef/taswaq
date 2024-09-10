import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/api/end_ponits.dart';
import '../../../../core/cache/cache_helper.dart';
import '../../../../core/di/dependency_injuction.dart';
import '../../domain/repo/cart_repo.dart';
import '../cubits/cart_cubit/cart_cubit.dart';
import '../widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static const routeName = 'CartView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) => CartCubit(
          getIt<CartRepo>(),
        )..getCartItems(
            id: getIt<CacheHelper>().getData(key: ApiKey.userId),
          ),
        child: const SafeArea(
          child: CartViewBody(),
        ),
      ),
    );
  }
}
