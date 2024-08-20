import 'package:flutter/material.dart';
import '../../../../core/shared/widgets/spacers.dart';
import 'product_view_top_bar.dart';
import '../../../../core/shared/widgets/constants.dart';
import 'products_grid_view.dart';

class ProductViewBody extends StatelessWidget {
  const ProductViewBody({
    super.key,
    required this.categoryTitle,
  });
  final String categoryTitle;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizantalpadding),
      child: Column(
        children: [
          ProductTopBar(
            title: categoryTitle,
          ),
          const VerticalSpace(12),
          const ProductsGridView(),
        ],
      ),
    );
  }
}
