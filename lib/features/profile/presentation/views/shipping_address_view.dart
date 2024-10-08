import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/shared/functions/toast_dialog.dart';
import '../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../core/di/dependency_injuction.dart';
import '../../../../core/shared/widgets/custom_text_form_field.dart';
import '../../../../core/shared/widgets/default_app_button.dart';
import '../../../../core/shared/widgets/drop_down_button.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../../../../core/utils/app_colors.dart';
import '../../domain/repo/profile_repo.dart';
import '../manger/profile_cubit/profile_cubit.dart';
import '../widgets/profile_form.dart';
import '../../../../core/shared/widgets/constants.dart';
import '../widgets/phone_field.dart';

class ShippingAddressView extends StatelessWidget {
  const ShippingAddressView({super.key});
  static const String routeName = 'ShippingAddressView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildCustomAppBar(title: 'Shipping Address'),
      body: BlocProvider(
        create: (context) => ProfileCubit(
          getIt<ProfileRepo>(),
        ),
        child: Builder(builder: (context) {
          final cubit = context.read<ProfileCubit>();

          return BlocListener<ProfileCubit, ProfileState>(
            listenWhen: (previous, current) =>
                current is AddUserAddressFailure ||
                current is AddUserAddressSuccess,
            listener: (context, state) {
              if (state is AddUserAddressFailure) {
                showToast(text: 'Failed to add address');
              }
              if (state is AddUserAddressSuccess) {
                showToast(text: 'Address added successfully');
              }
            },
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: kHorizantalpadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ProfileForm(title: 'Full Name '),
                    const VerticalSpace(8),
                    CustomTextFormField(
                      hintText: 'Enter full name',
                      controller: cubit.fullName,
                    ),
                    const VerticalSpace(12),
                    const ProfileForm(title: 'Phone Number '),
                    const VerticalSpace(8),
                    PhoneField(
                      controller: cubit.phoneNumber,
                    ),
                    const VerticalSpace(12),
                    CustomDropDown(
                      title: 'Select City',
                      onSaved: (val) {
                        cubit.city.text = val!;
                      },
                      onChanged: (val) {
                        cubit.city.text = val!;
                      },
                      items: cities,
                    ),
                    const VerticalSpace(12),
                    const ProfileForm(title: 'Street Address '),
                    const VerticalSpace(8),
                    CustomTextFormField(
                      hintText: 'Enter street address',
                      controller: cubit.streetName,
                    ),
                    const VerticalSpace(12),
                    const ProfileForm(title: 'Postal Code '),
                    const VerticalSpace(8),
                    CustomTextFormField(
                      hintText: 'Enter postal code',
                      controller: cubit.postalCode,
                    ),
                    const VerticalSpace(24),
                    DefaultAppButton(
                      onPressed: () {
                        cubit.addUserAddress();
                      },
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
        }),
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
