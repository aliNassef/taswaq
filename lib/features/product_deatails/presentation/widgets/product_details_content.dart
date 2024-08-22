import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:readmore/readmore.dart';
import 'package:taswaq/features/product_deatails/domain/entity/product_detais_entity/product_details_entity.dart';
import 'package:taswaq/features/product_deatails/presentation/widgets/add_to_cart_or_buy_now.dart';
import '../../../../core/shared/widgets/constants.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import 'counter_widget.dart';
import 'custom_rating_and_reviews.dart';
import 'tag_item.dart';
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
          padding: EdgeInsets.symmetric(
            vertical: 20.h,
            horizontal: kHorizantalpadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticalSpace(20),
              SizedBox(
                height: 30.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (cxt, index) {
                    return TagItem(title: instance.tags![index]);
                  },
                  separatorBuilder: (cxt, index) => const HorizantalSpace(10),
                  itemCount: instance.tags!.length,
                ),
              ),
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
              ReadMoreText(
                instance.description!,
                trimMode: TrimMode.Line,
                trimLines: 3,
                style: AppStyles.textStyle14R.copyWith(
                  color: AppColors.gray150Color,
                ),
                colorClickableText: AppColors.primaryColor,
                trimCollapsedText: 'Read more',
                trimExpandedText: 'Show less',
                moreStyle: AppStyles.textStyle14R.copyWith(
                  color: AppColors.primaryColor,
                ),
              ),
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
              const AddToCartOrBuyNow(),
              const VerticalSpace(30),
            ],
          ),
        ),
      ),
    );
  }
}
