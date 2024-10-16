import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../domain/entity/product_detais_entity/product_details_entity.dart';
import '../cubits/add_product_to_cart_cubit/add_product_to_cart_cubit.dart';
import 'add_to_cart_or_buy_now.dart';
import 'discription_product_widget.dart';
import 'list_of_tags.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import 'counter_widget.dart';
import 'custom_rating_and_reviews.dart';
import 'title_and_price_row.dart';

class ProductDetailsContent extends StatelessWidget {
  const ProductDetailsContent({
    super.key,
    required this.instance,
  });
  final ProductDetailsEntity instance;
  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -30),
      child: Container(
        height: MediaQuery.sizeOf(context).height -
            (MediaQuery.of(context).size.height * .32),
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.only(
            top: 20.h,
            bottom: 30.h,
            left: kHorizantalpadding,
            right: kHorizantalpadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalSpace(20),
              ListOfTags(instance: instance),
              const VerticalSpace(6),
              TitleAndPriceRow(
                title: instance.title!,
                price: instance.price!,
                discountPercentage: instance.discountPercentage!,
              ),
              const VerticalSpace(12),
              CustomRatingAndReviews(
                rating: instance.rating!,
                reviews: instance.reviews!.length,
              ),
              const VerticalSpace(12),
              DescriptionProductWidget(instance: instance),
              const VerticalSpace(12),
              Text(
                'Quantity',
                style: AppStyles.textStyle12SB.copyWith(
                  color: AppColors.blackColor,
                ),
              ),
              const VerticalSpace(12),
              BlocBuilder<AddProductToCartCubit, AddProductToCartState>(
                buildWhen: (previous, current) =>
                    current is QuantityIncremented ||
                    current is QuantityDecremented,
                builder: (context, state) {
                  final cubit = context.read<AddProductToCartCubit>();
                  return CounterWidget(
                    increment: () {
                      log('message');
                      cubit.incrementQuantity();
                    },
                    quantity: cubit.quantity,
                    decrement: () {
                      cubit.decrementQuantity();
                    },
                  );
                },
              ),
              const Spacer(),
              AddToCartOrBuyNow(
                instance: instance,
              ),
              const VerticalSpace(30),
            ],
          ),
        ),
      ),
    );
  }
}
