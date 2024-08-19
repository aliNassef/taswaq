import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taswaq/core/shared/widgets/spacers.dart';
import 'package:taswaq/features/products/presentation/views/product_view.dart';
import 'categories_header.dart';
import 'categories_horizantl_list.dart';
import 'home_top_bar.dart';
import 'offer_horizantal_list.dart';
import 'product_section_grid_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const HomeTopBar(),
        const OfferHorizantalList(),
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20.h),
          child: HeaderRow(
            title: 'Categories',
            onTap: () {},
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 8, right: 8),
          child: CategoriesHorizantalList(),
        ),
        const VerticalSpace(24),
        HeaderRow(
          title: 'Latest Products',
          onTap: () {},
        ),
        const ProductSectionGridView(),
      ],
    );
  }
}
