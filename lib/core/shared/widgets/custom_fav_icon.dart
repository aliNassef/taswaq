import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../utils/app_colors.dart';

class CustomFavIcon extends StatelessWidget {
  const CustomFavIcon({
    super.key,
    this.onTap,
  });
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onTap,
      icon: CircleAvatar(
        radius: 20.h,
        // backgroundColor: Colors.white,
        backgroundColor: AppColors.blackColor,
        child: const Icon(
          Icons.favorite_outline_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
