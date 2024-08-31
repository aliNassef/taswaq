import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taswaq/features/product_deatails/domain/entity/product_detais_entity/product_details_entity.dart';
import 'package:taswaq/features/product_deatails/presentation/widgets/add_to_cart_or_buy_now.dart';
import 'package:taswaq/features/product_deatails/presentation/widgets/discription_product_widget.dart';
import 'package:taswaq/features/product_deatails/presentation/widgets/list_of_tags.dart';
import '../../../../core/shared/widgets/constants.dart';
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
              const CounterWidget(),
              const VerticalSpace(12),
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
