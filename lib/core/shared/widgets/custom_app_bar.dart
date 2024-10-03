import 'package:flutter/material.dart';
import 'package:taswaq/core/shared/widgets/constants.dart';

import '../../utils/app_colors.dart';
import '../../utils/app_styles.dart';

AppBar buildCustomAppBar({required String title}) {
  return AppBar(
    title: Text(
      title,
      style: AppStyles.textStyle14M,
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
  );
}

AppBar buildChangePassAppBar({required String title, required String pageNum}) {
  return AppBar(
    title: Text(
      'Change Password',
      style: AppStyles.textStyle14M,
    ),
    elevation: 0,
    backgroundColor: Colors.transparent,
    actions: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: kHorizantalpadding),
        child: Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '$pageNum/',
                style: AppStyles.textStyle14SB
                    .copyWith(color: AppColors.blackColor),
              ),
              TextSpan(
                text: '02',
                style: AppStyles.textStyle14SB
                    .copyWith(color: AppColors.gray100Color),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}