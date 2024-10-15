import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/shared/widgets/constants.dart';
import '../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../widget/preview_item_image.dart';

class PreviewItemView extends StatelessWidget {
  const PreviewItemView({super.key});
  static const String routeName = 'PreviewItemView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(title: 'Preview Item'),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
                horizontal: kHorizantalpadding, vertical: 10.h),
            child: Row(
              children: [
                const PreviewItemImage(
                    img:
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtncDWZk8q3p23w_g2_I71EJwKjnJFPMMKAxPxJtyZDi3-gBf5WwH_65E&s'),
                const HorizantalSpace(8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'name',
                        style: AppStyles.textStyle14M.copyWith(
                          color: AppColors.blackColor,
                          overflow: TextOverflow.ellipsis,
                        ),
                        maxLines: 2,
                      ),
                      Text(
                        'price',
                        style: AppStyles.textStyle12SB
                            .copyWith(color: AppColors.blackColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
