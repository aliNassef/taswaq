import 'package:flutter/material.dart';

import '../../../../core/shared/widgets/constants.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';

class HeaderRow extends StatelessWidget {
  const HeaderRow({
    super.key,
    required this.title,
    this.onTap,
  });
  final String title;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizantalpadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: AppStyles.textStyle18B,
          ),
          InkWell(
            onTap: onTap,
            child: Text(
              'See All',
              style: AppStyles.textStyle14SB
                  .copyWith(color: AppColors.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
