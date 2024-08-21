import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:readmore/readmore.dart';
import 'package:taswaq/core/shared/widgets/constants.dart';
import 'package:taswaq/core/shared/widgets/spacers.dart';
import 'package:taswaq/core/utils/app_colors.dart';
import 'package:taswaq/core/utils/app_images.dart';
import 'package:taswaq/core/utils/app_styles.dart';
import 'package:taswaq/features/product_deatails/presentation/cubits/get_product_details_cubit/get_product_detaisl_cubit.dart';
import 'package:taswaq/features/product_deatails/presentation/widgets/counter_widget.dart';
import 'package:taswaq/features/product_deatails/presentation/widgets/custom_rating_and_reviews.dart';
import 'package:taswaq/features/product_deatails/presentation/widgets/tag_item.dart';
import 'package:taswaq/features/product_deatails/presentation/widgets/title_and_price_row.dart';

import '../../../../core/shared/widgets/default_app_button.dart';

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
