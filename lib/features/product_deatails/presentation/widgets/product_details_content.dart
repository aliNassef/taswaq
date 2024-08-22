import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:readmore/readmore.dart';
import '../../../../core/shared/widgets/constants.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';
import 'counter_widget.dart';
import 'custom_rating_and_reviews.dart';
import 'tag_item.dart';
import 'title_and_price_row.dart';

import '../../../../core/shared/widgets/default_app_button.dart';

class ProductDetailsContent extends StatelessWidget {
  const ProductDetailsContent({
    super.key,
  });

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
              vertical: 20.h, horizontal: kHorizantalpadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  TagItem(
                    title: 'data',
                  ),
                  HorizantalSpace(10),
                  TagItem(
                    title: 'data',
                  ),
                ],
              ),
              const VerticalSpace(6),
              const TitleAndPriceRow(),
              const VerticalSpace(12),
              const CustomRatingAndReviews(),
              const VerticalSpace(12),
              ReadMoreText(
                'Constructed with high-quality silicone material, the Loop Silicone Strong Magnetic Watch ensures a comfortable and secure fit on your wrist. The soft and flexible silicone is gentle on the skin, making it ideal for',
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
              Row(
                children: [
                  Expanded(
                    child: DefaultAppButton(
                      backgroundColor: Colors.white,
                      text: 'Buy Now',
                      textColor: AppColors.blackColor,
                      onPressed: () {},
                    ),
                  ),
                  const HorizantalSpace(12),
                  Expanded(
                    child: DefaultAppButton(
                      backgroundColor: AppColors.blackColor,
                      text: 'Add to Cart',
                      icon: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: SvgPicture.asset(AppSvgs.shoppingCart),
                      ),
                      textColor: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
