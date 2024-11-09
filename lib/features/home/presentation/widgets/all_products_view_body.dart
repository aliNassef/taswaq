import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:taswaq/features/home/domain/entities/product_entity/product_entity.dart';
import 'package:taswaq/features/home/presentation/cubits/get_products_cubit/get_products_cubit.dart';
import 'package:taswaq/features/home/presentation/widgets/product_item.dart';

import '../../../../core/utils/constants.dart';

class AllProductsViewBody extends StatelessWidget {
  const AllProductsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductsCubit, GetProductsState>(
      buildWhen: (previous, current) =>
          current is GetProductsLoaded ||
          current is GetProductsFailure ||
          current is GetProductsLoading,
      builder: (context, state) {
        if (state is GetProductsFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        } else if (state is GetProductsLoaded) {
          return GridView.builder(
            padding: EdgeInsets.symmetric(
                horizontal: kHorizantalpadding, vertical: 20),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12.h,
              mainAxisExtent: 210.h,
              crossAxisSpacing: 8.w,
            ),
            itemCount: state.productList.length,
            itemBuilder: (_, index) {
              return ProductItem(instance: state.productList[index]);
            },
          );
        } else {
          return Skeletonizer(
              child: GridView.builder(
            padding: EdgeInsets.symmetric(
                horizontal: kHorizantalpadding, vertical: 20),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12.h,
              mainAxisExtent: 210.h,
              crossAxisSpacing: 8.w,
            ),
            itemCount: 3,
            itemBuilder: (_, index) {
              return ProductItem(instance: dummyProducts[index]);
            },
          ));
        }
      },
    );
  }

  final List<ProductEntity> dummyProducts = const [
    ProductEntity(
      title: 'Essence Mascara Lash Princess',
      thumbnail:
          'https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png',
      price: 1,
      discountPercentage: 1,
    ),
    ProductEntity(
      title: 'Essence Mascara Lash Princess',
      thumbnail:
          'https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png',
      price: 1,
      discountPercentage: 1,
    ),
    ProductEntity(
      title: 'Essence Mascara Lash Princess',
      thumbnail:
          'https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/thumbnail.png',
      price: 1,
      discountPercentage: 1,
    ),
  ];
}
