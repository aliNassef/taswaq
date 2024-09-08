import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taswaq/core/api/end_ponits.dart';
import 'package:taswaq/core/cache/cache_helper.dart';
import 'package:taswaq/core/di/dependency_injuction.dart';
import 'package:taswaq/core/utils/app_colors.dart';
import 'package:taswaq/core/utils/app_styles.dart';
import 'package:taswaq/features/cart/domain/repo/cart_repo.dart';
import 'package:taswaq/features/cart/presentation/cubits/cart_cubit/cart_cubit.dart';
import 'package:taswaq/features/cart/presentation/widgets/cart_view_body.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});
  static const routeName = 'CartView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCartAppBar(context),
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

  AppBar buildCartAppBar(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.transparent,
      centerTitle: true,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
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
