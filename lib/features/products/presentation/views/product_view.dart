 
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taswaq/core/di/dependency_injuction.dart';
import 'package:taswaq/features/products/domain/repo/product_repo.dart';
import 'package:taswaq/features/products/presentation/cubits/get_product_by_category_cubit/getproductsbycategory_cubit.dart';
import 'package:taswaq/features/products/presentation/widgets/product_view_body.dart';

class ProductView extends StatelessWidget {
  const ProductView({super.key, required this.category});
  static const routeName = '/productView';
  final String category;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
        create: (context) => GetProductsByCategoryCubit(
          getIt.get<ProductRepo>(),
        )..getProductsByCategory(category: category),
        child: SafeArea(
          child: ProductViewBody(
            categoryTitle: category,
          ),
        ),
      ),
    );
  }
}
