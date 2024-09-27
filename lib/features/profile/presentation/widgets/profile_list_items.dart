import 'package:flutter/material.dart';
import 'package:taswaq/core/shared/widgets/spacers.dart';
import 'package:taswaq/core/utils/app_colors.dart';
import 'package:taswaq/core/utils/app_images.dart';
import 'package:taswaq/core/utils/app_styles.dart';
import 'package:taswaq/features/profile/presentation/views/change_pass_view.dart';
import 'package:taswaq/features/profile/presentation/views/faqs_view.dart';
import 'package:taswaq/features/profile/presentation/views/shipping_address_view.dart';
import 'package:taswaq/features/profile/presentation/views/terms_condations_view.dart';
import 'package:taswaq/features/profile/presentation/widgets/profile_list_item.dart';

import '../views/privacy_policy_view.dart';

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
          onTap: () {
            Navigator.pushNamed(context, ShippingAddressView.routeName);
          },
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
          onTap: () {
            Navigator.pushNamed(context, PrivacyPolicyView.routeName);
          },
          img: AppSvgs.policyIcon,
          text: 'Privacy Policy',
        ),
        ProfileListItem(
          onTap: () {
            Navigator.pushNamed(context, TermsCondationsView.routeName);
          },
          img: AppSvgs.termsIcon,
          text: 'Terms & Conditions',
        ),
        ProfileListItem(
          onTap: () {
            Navigator.pushNamed(context, FaqsView.routeName);
          },
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
