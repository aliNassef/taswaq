
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class WishListTopBar extends StatelessWidget {
  const WishListTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios,
              color: AppColors.blackColor,
            ),
          ),
          const Spacer(),
          Text(
            'WishList',
            style: AppStyles.textStyle14M.copyWith(
              color: AppColors.blackColor,
            ),
          ),
          HorizantalSpace(MediaQuery.sizeOf(context).width / 2 - 40)
        ],
      ),
    );
  }
}
