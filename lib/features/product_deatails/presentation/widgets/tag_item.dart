import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_styles.dart';

class TagItem extends StatelessWidget {
  const TagItem({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24.h,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(6),
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.all(
          Radius.circular(8),
        ),
      ),
      child: Text(
        title,
        style: AppStyles.textStyle12SB.copyWith(color: Colors.white),
      ),
    );
  }
}
