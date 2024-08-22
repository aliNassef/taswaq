import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/get_product_details_cubit/get_product_detaisl_cubit.dart';
import 'product_details_content.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductDetailsCubit, GetProductDetailsState>(
      builder: (context, state) {
        return SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Image.network(
                    'https://kawaiiai.com/wp-content/uploads/2022/09/gangaster-cat-7.jpg',
                    fit: BoxFit.fill,
                    height: MediaQuery.of(context).size.height * .32,
                    width: MediaQuery.of(context).size.width,
                  ),
                ],
              ),
              const ProductDetailsContent(),
            ],
          ),
        );
      },
    );
  }
}
