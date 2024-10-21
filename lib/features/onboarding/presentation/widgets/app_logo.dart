
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:taswaq/core/utils/app_images.dart';

import '../../../../core/shared/widgets/spacers.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image.asset(
          AppImages.quickSign,
          height: 32.h,
          width: 32.w,
        ),
        const HorizantalSpace(4),
        Image.asset(
          AppImages.quickMarket,
          height: 32.h,
          width: 100.w,
        )
      ],
    );
  }
}
