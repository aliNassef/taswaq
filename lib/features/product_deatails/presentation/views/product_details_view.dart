import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taswaq/core/di/dependency_injuction.dart';
import 'package:taswaq/features/product_deatails/data/repo/product_details_repo_impl.dart';
import 'package:taswaq/features/product_deatails/domain/repo/product_details_repo.dart';
import 'package:taswaq/features/product_deatails/presentation/widgets/product_details_view_body.dart';

import '../cubits/get_product_details_cubit/get_product_detaisl_cubit.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});
  static const String routeName = 'product_details_view';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => GetProductDetailsCubit(
          getIt.get<ProductDetailsRepo>(),
        )..getProductDetails(productId: 1),
        child: const SafeArea(
          child: ProductDetailsViewBody(),
        ),
      ),
    );
  }
}
