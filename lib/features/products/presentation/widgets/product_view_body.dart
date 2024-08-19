import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taswaq/core/shared/widgets/spacers.dart';
import 'package:taswaq/features/products/presentation/cubits/get_product_by_category_cubit/getproductsbycategory_cubit.dart';
import 'package:taswaq/features/products/presentation/cubits/get_product_by_category_cubit/getproductsbycategory_state.dart';
import 'package:taswaq/features/products/presentation/widgets/product_view_top_bar.dart';
import '../../../../core/shared/widgets/constants.dart';
import 'products_grid_view.dart';

class ProductViewBody extends StatelessWidget {
  const ProductViewBody({
    super.key, required this.categoryTitle,
  });
  final String categoryTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizantalpadding),
      child:   Column(
        children: [
          ProductTopBar(title: categoryTitle,),
          const VerticalSpace(12),
          const ProductsGridView(),
        ],
      ),
    );
  }
}
