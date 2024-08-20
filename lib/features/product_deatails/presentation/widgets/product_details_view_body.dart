import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taswaq/features/product_deatails/presentation/cubits/get_product_details_cubit/get_product_detaisl_cubit.dart';

class ProductDetailsViewBody extends StatelessWidget {
  const ProductDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductDetailsCubit, GetProductDetailsState>(
      builder: (context, state) {
        return const Placeholder();
      },
    );
  }
}
