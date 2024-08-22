import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class CustomRatingAndReviews extends StatelessWidget {
  const CustomRatingAndReviews({
    super.key,
    required this.rating,
    required this.reviews,
  });
  final double rating;
  final int reviews;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RatingBar.readOnly(
          size: 15.h,
          halfFilledIcon: Icons.star_half,
          isHalfAllowed: true,
          filledIcon: Icons.star,
          emptyIcon: Icons.star_border,
          initialRating: rating,
          maxRating: 5,
        ),
        const HorizantalSpace(10),
        Text(
          '$rating ($reviews reviews) ',
          style: AppStyles.textStyle10SB.copyWith(
            color: AppColors.blackColor,
          ),
        ),
      ],
    );
  }
}
