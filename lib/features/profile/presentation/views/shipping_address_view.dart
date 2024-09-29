import 'package:flutter/material.dart';
import '../../../../core/shared/widgets/custom_text_form_field.dart';
import '../../../../core/shared/widgets/default_app_button.dart';
import '../../../../core/shared/widgets/drop_down_button.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_colors.dart';
import '../widgets/profile_form.dart';
import '../../../../core/shared/widgets/constants.dart';
import '../../../../core/utils/app_styles.dart';
import '../widgets/phone_field.dart';

class ShippingAddressView extends StatelessWidget {
  const ShippingAddressView({super.key});
  static const String routeName = 'ShippingAddressView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAddressAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: kHorizantalpadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ProfileForm(title: 'Full Name '),
              const VerticalSpace(8),
              CustomTextFormField(
                hintText: 'Enter full name',
                controller: TextEditingController(),
              ),
              const VerticalSpace(12),
              const ProfileForm(title: 'Phone Number '),
              const VerticalSpace(8),
              const PhoneField(),
              const VerticalSpace(12),
              const CustomDropDown(title: 'Select City'),
              const VerticalSpace(12),
              const ProfileForm(title: 'Street Address '),
              const VerticalSpace(8),
              CustomTextFormField(
                hintText: 'Enter street address',
                controller: TextEditingController(),
              ),
              const VerticalSpace(12),
              const ProfileForm(title: 'Postal Code '),
              const VerticalSpace(8),
              CustomTextFormField(
                hintText: 'Enter postal code',
                controller: TextEditingController(),
              ),
              const VerticalSpace(24),
              const DefaultAppButton(
                padding: 0,
                text: 'save',
                backgroundColor: AppColors.blackColor,
                textColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAddressAppBar() {
    return AppBar(
      title: Text(
        'Shipping Address',
        style: AppStyles.textStyle14M,
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}
