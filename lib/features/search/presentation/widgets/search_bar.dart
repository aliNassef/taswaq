import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utils/app_images.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({super.key, required this.searchController, this.onSubmitted});
  final TextEditingController searchController;
  final void Function(String)? onSubmitted;
  @override
  Widget build(BuildContext context) {
    return TextField(
      textInputAction: TextInputAction.search,
      onSubmitted: onSubmitted,
      controller: searchController,
      decoration: InputDecoration(
        hintText: 'Search',
        hintStyle: AppStyles.textStyle12R.copyWith(
          color: AppColors.gray150Color,
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SvgPicture.asset(
            AppSvgs.searchbarIcin,
            height: 24.h,
            width: 24.w,
          ),
        ),
        border: buildSearchBorderStyle(),
        enabledBorder: buildSearchBorderStyle(),
        focusedBorder: buildSearchBorderStyle(),
      ),
    );
  }

  OutlineInputBorder buildSearchBorderStyle() {
    return const OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(12)),
      borderSide: BorderSide(
        width: 2,
        color: AppColors.gray50Color,
      ),
    );
  }
}
