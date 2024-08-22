import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taswaq/features/product_deatails/presentation/widgets/add_to_cart_or_buy_now.dart';
import '../cubits/get_product_details_cubit/get_product_detaisl_cubit.dart';
import 'product_details_content.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductDetailsCubit, GetProductDetailsState>(
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
                    Stack(
                      children: [
                        

                        Image.network(
                          product.images![0],
                          fit: BoxFit.fill,
                          height: MediaQuery.of(context).size.height * .32,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ],
                    ),
                    ProductDetailsContent(
                      instance: product,
                    ),
                  ],
                ),
              ),
            ],
          );
        }
        // handle loading data
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
