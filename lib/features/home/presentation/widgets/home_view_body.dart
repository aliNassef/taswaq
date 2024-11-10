import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taswaq/features/home/presentation/view/all_products_view.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/constants.dart';
import '../cubits/get_categories_cubit/get_categories_cubit.dart';
import '../cubits/get_products_cubit/get_products_cubit.dart';
import 'categories_header.dart';
import 'categories_horizantl_list.dart';
import 'home_top_bar.dart';
import 'offer_horizantal_list.dart';
import 'product_section_grid_view.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({
    super.key,
  });

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  @override
  void initState() {
    super.initState();
    Future.wait([
      context.read<GetCategoriesCubit>().getCategories(),
      context.read<GetProductsCubit>().getProducts(),
      context.read<GetCategoriesCubit>().getOffers(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        const SliverToBoxAdapter(
          child: Column(
            children: [
              VerticalSpace(30),
              HomeTopBar(),
            ],
          ),
        ),
        const SliverToBoxAdapter(
          child: OfferHorizantalList(),
        ),
        SliverToBoxAdapter(
          child: Column(
            children: [
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
                onTap: () {
                  Navigator.pushNamed(context, AllProductsView.routeName);
                },
              ),
              // const VerticalSpace(24),
            ],
          ),
        ),
        SliverPadding(
          padding: EdgeInsets.symmetric(
              vertical: 20.h, horizontal: kHorizantalpadding),
          sliver: const ProductSectionGridView(),
        ),
      ],
    );
  }
}
