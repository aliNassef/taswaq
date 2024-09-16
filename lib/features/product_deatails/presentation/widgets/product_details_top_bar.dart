import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubits/get_product_details_cubit/get_product_detaisl_cubit.dart';
 import '../../../../core/shared/widgets/constants.dart';
import '../../../../core/shared/widgets/custom_fav_icon.dart';
import '../../domain/entity/product_detais_entity/product_details_entity.dart';

class ProductDetailsTopBar extends StatelessWidget {
  const ProductDetailsTopBar({
    super.key,
    required this.product,
  });
  final ProductDetailsEntity product;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizantalpadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: const Icon(Icons.arrow_back_ios_new_outlined),
          ),
          BlocBuilder<GetProductDetailsCubit, GetProductDetailsState>(
            buildWhen: (previous, current) => current is ToggleFavoriteSuccess,
            builder: (context, state) {
              return CustomFavIcon(
                isFav: context.read<GetProductDetailsCubit>().isFav,
                onTap: () async {
                  await context
                      .read<GetProductDetailsCubit>()
                      .toggleFavorite(product: product);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
