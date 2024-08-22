import 'package:custom_rating_bar/custom_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class CustomRatingAndReviews extends StatelessWidget {
  const CustomRatingAndReviews({
    super.key,
  });

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
          initialRating: 4.5,
          maxRating: 5,
        ),
        const HorizantalSpace(10),
        Text(
          '4.5 (2,495 reviews) ',
          style: AppStyles.textStyle10SB.copyWith(
            color: AppColors.blackColor,
          ),
        ),
      ],
    );
  }
}
