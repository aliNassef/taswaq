import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/api/end_ponits.dart';
import '../../../../core/cache/cache_helper.dart';
import '../../../../core/di/dependency_injuction.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../domain/repo/cart_repo.dart';
import '../cubits/cart_cubit/cart_cubit.dart';
import '../widgets/cart_view_body.dart';

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
