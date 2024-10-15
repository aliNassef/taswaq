import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/shared/functions/toast_dialog.dart';
import '../../../../core/shared/widgets/custom_app_bar.dart';
import '../../../../core/di/dependency_injuction.dart';
import '../../domain/repo/profile_repo.dart';
import '../manger/profile_cubit/profile_cubit.dart';
import '../../../../core/shared/widgets/shipping_address_view_body.dart';

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
              child: ShippingAddressViewBody(
                fullName: context.read<ProfileCubit>().fullName,
                city: context.read<ProfileCubit>().city,
                phoneNumber: context.read<ProfileCubit>().phoneNumber,
                streetName: context.read<ProfileCubit>().streetName,
                postalCode: context.read<ProfileCubit>().postalCode,
                onPressed: () {
                  context.read<ProfileCubit>().addUserAddress();
                },
              ),
            ),
          );
        }),
      ),
    );
  }
}
