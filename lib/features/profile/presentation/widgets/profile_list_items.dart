import 'package:flutter/material.dart';
import 'package:taswaq/core/shared/widgets/spacers.dart';
import 'package:taswaq/core/utils/app_colors.dart';
import 'package:taswaq/core/utils/app_images.dart';
import 'package:taswaq/core/utils/app_styles.dart';
import 'package:taswaq/features/profile/presentation/views/change_pass_view.dart';
import 'package:taswaq/features/profile/presentation/widgets/profile_list_item.dart';

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
          onTap: () {
            Navigator.pushNamed(context, ChangePassView.routeName);
          },
          img: AppSvgs.lockIcon,
          text: 'Change Password',
        ),
        //
        // change theme button still needed to be added
      ],
    );
  }
}
