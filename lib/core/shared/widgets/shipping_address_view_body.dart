import 'package:flutter/material.dart';

import 'constants.dart';
import 'custom_text_form_field.dart';
import 'default_app_button.dart';
import 'drop_down_button.dart';
import 'spacers.dart';
import 'title_form.dart';
import '../../utils/app_colors.dart';
import '../../../features/profile/presentation/widgets/phone_field.dart';

class ShippingAddressViewBody extends StatelessWidget {
  const ShippingAddressViewBody({
    super.key,
    required this.fullName,
    required this.phoneNumber,
    required this.streetName,
    required this.city,
    required this.postalCode,
    required this.onPressed,
  });
  final TextEditingController fullName;
  final TextEditingController phoneNumber;
  final TextEditingController streetName;
  final TextEditingController city;
  final TextEditingController postalCode;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: kHorizantalpadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TitleForm(title: 'Full Name '),
          const VerticalSpace(8),
          CustomTextFormField(
            hintText: 'Enter full name',
            controller: fullName,
          ),
          const VerticalSpace(12),
          const TitleForm(title: 'Phone Number '),
          const VerticalSpace(8),
          PhoneField(
            controller: phoneNumber,
          ),
          const VerticalSpace(12),
          CustomDropDown(
            title: 'Select City',
            onSaved: (val) {
              city.text = val!;
            },
            onChanged: (val) {
              city.text = val!;
            },
            items: cities,
          ),
          const VerticalSpace(12),
          const TitleForm(title: 'Street Address '),
          const VerticalSpace(8),
          CustomTextFormField(
            hintText: 'Enter street address',
            controller: streetName,
          ),
          const VerticalSpace(12),
          const TitleForm(title: 'Postal Code '),
          const VerticalSpace(8),
          CustomTextFormField(
            hintText: 'Enter postal code',
            controller: postalCode,
          ),
          const VerticalSpace(24),
          DefaultAppButton(
            onPressed: onPressed,
            padding: 0,
            text: 'save',
            backgroundColor: AppColors.blackColor,
            textColor: Colors.white,
          ),
        ],
      ),
    );
  }

  final List<DropdownMenuItem<String>>? cities = const [
    DropdownMenuItem(value: 'Cairo', child: Text('Cairo')),
    DropdownMenuItem(value: 'Giza', child: Text('Giza')),
    DropdownMenuItem(value: 'Alex', child: Text('Alex')),
    DropdownMenuItem(value: 'Aswan', child: Text('Aswan')),
    DropdownMenuItem(value: 'Asyut', child: Text('Asyut')),
    DropdownMenuItem(value: 'Beheira', child: Text('Beheira')),
    DropdownMenuItem(value: 'Damietta', child: Text('Damietta')),
    DropdownMenuItem(value: 'Fayoum', child: Text('Fayoum')),
    DropdownMenuItem(value: 'Gharbia', child: Text('Gharbia')),
    DropdownMenuItem(value: 'Ismailia', child: Text('Ismailia')),
    DropdownMenuItem(value: 'Kafr El Sheikh', child: Text('Kafr El Sheikh')),
    DropdownMenuItem(value: 'Luxor', child: Text('Luxor')),
    DropdownMenuItem(value: 'Matruh', child: Text('Matruh')),
    DropdownMenuItem(value: 'Minya', child: Text('Minya')),
    DropdownMenuItem(value: 'Monufia', child: Text('Monufia')),
    DropdownMenuItem(value: 'Port Said', child: Text('Port Said')),
    DropdownMenuItem(value: 'Qena', child: Text('Qena')),
    DropdownMenuItem(value: 'Sohag', child: Text('Sohag')),
    DropdownMenuItem(value: 'South Sinai', child: Text('South Sinai')),
    DropdownMenuItem(value: 'Suez', child: Text('Suez')),
    DropdownMenuItem(value: 'Shibin El Kom', child: Text('Shibin El Kom')),
    DropdownMenuItem(value: 'Tanta', child: Text('Tanta')),
    DropdownMenuItem(value: 'Ismailia', child: Text('Ismailia')),
  ];
}
