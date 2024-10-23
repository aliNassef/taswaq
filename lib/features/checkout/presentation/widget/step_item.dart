import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/app_colors.dart';

class StepItem extends StatelessWidget {
  const StepItem({
    super.key,
    required this.title,
    required this.img,
  });
  final String title, img;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          img,
          height: 30.h,
          width: 30.w,
        ),
        Text(
          title,
          style: AppStyles.textStyle12SB.copyWith(
            color: AppColors.blackColor,
          ),
        ),
      ],
    );
  }
}
