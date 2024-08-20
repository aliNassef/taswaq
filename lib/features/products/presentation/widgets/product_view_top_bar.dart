import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';

class ProductTopBar extends StatelessWidget {
  const ProductTopBar({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          alignment: Alignment.center,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        Text(
          title,
          style: AppStyles.textStyle14M.copyWith(
            color: AppColors.blackColor,
          ),
        ),
        const Spacer(),
        IconButton(
          onPressed: () {},
          icon: RepaintBoundary(
            child: SvgPicture.asset(AppSvgs.sortIcon),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: RepaintBoundary(
            child: SvgPicture.asset(AppSvgs.searchIcon),
          ),
        ),
      ],
    );
  }
}
