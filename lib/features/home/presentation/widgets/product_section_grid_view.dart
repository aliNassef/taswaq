import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/utils/constants.dart';
import '../cubits/get_products_cubit/get_products_cubit.dart';

import 'product_item.dart';

class ProductSectionGridView extends StatelessWidget {
  const ProductSectionGridView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductsCubit, GetProductsState>(
      buildWhen: (previous, current) =>
          current is GetProductsLoaded ||
          current is GetProductsFailure ||
          current is GetProductsLoading,
      builder: (context, state) {
        if (state is GetProductsLoaded) {
          return Expanded(
            child: GridView.builder(
              padding: EdgeInsets.symmetric(
                  vertical: 20.h, horizontal: kHorizantalpadding),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 12.h,
                mainAxisExtent: 210.h,
                crossAxisSpacing: 8.w,
              ),
              itemBuilder: (context, index) {
                return ProductItem(
                  instance: state.productList[index],
                );
              },
              itemCount: state.productList.length,
            ),
          );
        }
        if (state is GetProductsFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        }

        return Expanded(
          child: GridView.builder(
            padding: EdgeInsets.symmetric(
                vertical: 12.h, horizontal: kHorizantalpadding),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12.h,
              mainAxisExtent: 227.h,
              crossAxisSpacing: 8.w,
            ),
            itemBuilder: (context, index) => Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildImageShimmer(context),
                  _buildTextShimmer(width: 100.w, height: 20.h),
                  _buildTextShimmer(width: 50.w, height: 20.h),
                  _buildTextShimmer(width: 70.w, height: 16.h),
                ],
              ),
            ),
            itemCount: 5,
          ),
        );
      },
    );
  }

  Widget _buildImageShimmer(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(24),
      child: Container(
        height: 138.h,
        width: MediaQuery.sizeOf(context).width,
        color: Colors.grey,
      ),
    );
  }

  Widget _buildTextShimmer({required double width, required double height}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 4.h),
      width: width,
      height: height,
      color: Colors.grey,
    );
  }
}
