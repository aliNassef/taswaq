import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:taswaq/core/shared/widgets/constants.dart';
import 'package:taswaq/core/shared/widgets/spacers.dart';
import 'package:taswaq/core/utils/app_images.dart';

import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../widgets/profile_list_item.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: SafeArea(
        bottom: false,
        child: ProfileViewBody(),
      ),
    );
  }
}

class ProfileViewBody extends StatelessWidget {
  const ProfileViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const VerticalSpace(8),
        ListTile(
          title: Text(
            'Ali Nassef',
            style: AppStyles.textStyle16SB.copyWith(
              color: Colors.white,
            ),
          ),
          subtitle: Text(
            'anassef798@gmail.com',
            style: AppStyles.textStyle14SB.copyWith(
              color: Colors.white,
            ),
          ),
          trailing: IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(AppSvgs.logoutIcon),
          ),
          leading: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(
              'https://kawaiiai.com/wp-content/uploads/2022/09/gangaster-cat-7.jpg',
              height: 40.h,
              width: 40.w,
            ),
          ),
        ),
        const VerticalSpace(16),
        Expanded(
          child: Container(
            alignment: Alignment.topLeft,
            padding: EdgeInsets.symmetric(horizontal: kHorizantalpadding.w),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(24),
              ),
            ),
            child: const ProfileListItems(),
          ),
        ),
      ],
    );
  }
}

class ProfileListItems extends StatelessWidget {
  const ProfileListItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const VerticalSpace(24),
        Text(
          'Personal Information',
          style: AppStyles.textStyle12SB.copyWith(
            color: AppColors.blackColor,
          ),
          textAlign: TextAlign.left,
        ),
        const VerticalSpace(12),
        ProfileListItem(
          onTap: () {},
          img: AppSvgs.shippingAddress,
          text: 'Shipping Address',
        ),
        ProfileListItem(
          onTap: () {},
          img: AppSvgs.paymentMethod,
          text: 'Payment Method',
        ),
        ProfileListItem(
          onTap: () {},
          img: AppSvgs.ordersIcon,
          text: 'Order History',
        ),
        Text(
          'Support & Information',
          style: AppStyles.textStyle12SB.copyWith(
            color: AppColors.blackColor,
          ),
          textAlign: TextAlign.left,
        ),
        ProfileListItem(
          onTap: () {},
          img: AppSvgs.policyIcon,
          text: 'Privacy Policy',
        ),
        ProfileListItem(
          onTap: () {},
          img: AppSvgs.termsIcon,
          text: 'Terms & Conditions',
        ),
        ProfileListItem(
          onTap: () {},
          img: AppSvgs.fqsIcon,
          text: 'FAQs',
        ),
        Text(
          'Account Management',
          style: AppStyles.textStyle12SB.copyWith(
            color: AppColors.blackColor,
          ),
          textAlign: TextAlign.left,
        ),
        ProfileListItem(
          onTap: () {},
          img: AppSvgs.lockIcon,
          text: 'Change Password',
        ),
        //
        // change theme button still needed to be added
      ],
    );
  }
}
