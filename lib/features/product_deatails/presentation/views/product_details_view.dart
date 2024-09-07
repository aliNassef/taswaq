import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/di/dependency_injuction.dart';
import '../../domain/repo/product_details_repo.dart';
import '../cubits/add_product_to_cart_cubit/add_product_to_cart_cubit.dart';
import '../widgets/product_details_view_body.dart';

import '../cubits/get_product_details_cubit/get_product_detaisl_cubit.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.productId});
  static const String routeName = 'product_details_view';
  final int productId;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => GetProductDetailsCubit(
              getIt.get<ProductDetailsRepo>(),
            )..getProductDetails(productId: productId),
          ),
          BlocProvider(
            create: (context) => AddProductToCartCubit(
              getIt.get<ProductDetailsRepo>(),
            ),
          ),
        ],
        child: const SafeArea(
          child: ProductDetailsViewBody(),
        ),
      ),
    );
  }
}
