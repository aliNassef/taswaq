import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/shared/widgets/constants.dart';
import '../../../../core/shared/widgets/spacers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../search/presentation/views/search_view.dart';
import '../../../../core/utils/app_images.dart';
import '../../../../core/utils/app_styles.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: 12.h, horizontal: kHorizantalpadding),
      child: Row(
        children: [
          Text(
            'Taswaq',
            style: AppStyles.textStyle16SB,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchView.routeName);
            },
            icon: SvgPicture.asset(
              AppSvgs.searchIcon,
              width: 32.w,
              height: 32.h,
            ),
          ),
          const HorizantalSpace(12),
          InkWell(
            onTap: () {},
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8).w,
              child: Image.network(
                'https://kawaiiai.com/wp-content/uploads/2022/09/gangaster-cat-7.jpg',
                height: 32.h,
                width: 32.w,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
