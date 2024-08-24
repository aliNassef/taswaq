import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taswaq/core/utils/app_colors.dart';
import '../cubits/get_product_details_cubit/get_product_detaisl_cubit.dart';
import 'product_details_content.dart';
import 'product_details_images.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductDetailsCubit, GetProductDetailsState>(
      buildWhen: (previous, current) =>
          current is GetProductDetaislFailure ||
          current is GetProductDetaislLoading ||
          current is GetProductDetaislLoaded,
      builder: (context, state) {
        if (state is GetProductDetaislFailure) {
          return Center(
            child: Text(state.errMessage),
          );
        }

        if (state is GetProductDetaislLoaded) {
          final product = state.productDetailsEntity;
          return CustomScrollView(
            slivers: [
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    PrdouctDetailsImages(product: product),
                    ProductDetailsContent(
                      instance: product,
                    ),
                  ],
                ),
              ),
            ],
          );
        }

        return const Center(
          child: CircularProgressIndicator(
            color: AppColors.primaryColor,
          ),
        );
      },
    );
  }
}
