import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_styles.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../products/presentation/views/product_view.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({
    super.key,
    required this.categoryName,
  });
  final String categoryName;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
       Navigator.pushNamed(context, ProductView.routeName, arguments: categoryName);
      },
      child: Container(
        alignment: Alignment.center,
        height: 80.h,
        width: 100.w,
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.primaryColor,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(12),
          ),
        ),
        child: Center(
          child: Text(
            categoryName,
            style: AppStyles.textStyle10SB.copyWith(
              color: AppColors.blackColor,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
