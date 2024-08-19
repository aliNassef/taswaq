import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:taswaq/features/products/presentation/cubits/get_product_by_category_cubit/getproductsbycategory_cubit.dart';
import 'package:taswaq/features/products/presentation/cubits/get_product_by_category_cubit/getproductsbycategory_state.dart';
import 'package:taswaq/features/products/presentation/widgets/product_grid_item.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class ProductsGridView extends StatelessWidget {
  const ProductsGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductsByCategoryCubit, GetProductsByCategoryState>(
      buildWhen: (previous, current) =>
          current is GetproductsbycategoryLoaded ||
          current is GetproductsbycategoryFailure ||
          current is GetproductsbycategoryLoading,
      builder: (context, state) {
        if (state is GetproductsbycategoryFailure) {
          return Center(child: Text(state.errMessage));
        }
        if (state is GetproductsbycategoryLoaded) {
          return Expanded(
            child: GridView.builder(
              itemCount: state.products.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12.h,
                mainAxisExtent: 180.h,
                crossAxisSpacing: 8.w,
              ),
              itemBuilder: (context, index) {
                final product = state.products[index];

                return ProductGridItem(
                  product: product,
                );
              },
            ),
          );
        }
        return Expanded(
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12.h,
              mainAxisExtent: 180.h,
              crossAxisSpacing: 8.w,
            ),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(
                        'https://kawaiiai.com/wp-content/uploads/2022/09/gangaster-cat-7.jpg',
                        height: 138.h,
                        width: double.infinity,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Shimmer.fromColors(
                      baseColor: Colors.grey[300]!,
                      highlightColor: Colors.grey[100]!,
                      child: Container(
                        height: 14.h,
                        width: 100.w,
                        color: Colors.white,
                        child: Text(
                          'Product Name',
                          style: AppStyles.textStyle14M.copyWith(
                            overflow: TextOverflow.ellipsis,
                            color: AppColors.blackColor,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }
}
