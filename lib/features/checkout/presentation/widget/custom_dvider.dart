import 'package:flutter/material.dart';

import '../../../../core/utils/app_colors.dart';

class CustomDvider extends StatelessWidget {
  const CustomDvider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: const BoxDecoration(
        color: AppColors.gray100Color,
      ),
      width: MediaQuery.sizeOf(context).width / 5,
      height: 1,
    );
  }
}
