import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../core/utils/constants.dart';
import '../../../../core/shared/widgets/spacers.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../search/presentation/views/search_view.dart';
import '../../../../core/utils/app_images.dart';

class HomeTopBar extends StatelessWidget {
  const HomeTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          EdgeInsets.symmetric(vertical: 12.h, horizontal: kHorizantalpadding),
      child: Row(
        children: [
          SvgPicture.asset(
            AppSvgs.logo,
          ),
          const Spacer(),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchView.routeName);
            },
            icon: SvgPicture.asset(
              AppSvgs.searchIcon,
              width: 24.w,
              height: 24.h,
            ),
          ),
          const HorizantalSpace(6),
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
