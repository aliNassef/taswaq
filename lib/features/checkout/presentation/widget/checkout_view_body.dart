import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taswaq/features/checkout/presentation/manger/cubit/checkout_state.dart';
import 'package:taswaq/core/shared/widgets/shipping_address_view_body.dart';
import 'package:taswaq/features/checkout/presentation/view/checkout_review.dart';

import '../../../../core/shared/functions/build_error_message.dart';
import '../../../../core/shared/widgets/constants.dart';
import '../../../../core/shared/widgets/spacers.dart';
import '../manger/cubit/checkout_cubit.dart';
import 'custom_stepper.dart';

class CheckoutViewBody extends StatelessWidget {
  const CheckoutViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: kHorizantalpadding),
        child: Column(
          children: [
            const CustomStepper(),
            const VerticalSpace(24),
            BlocConsumer<CheckoutCubit, CheckoutState>(
              listener: (context, state) {
                if (state.isFailure) {
                  buildErrorMessage(context, errMessage: state.errMessage!);
                }
                if (state.isSuccess) {
                  Navigator.pushNamed(context, CheckoutReviewView.routeName);
                }
              },
              builder: (context, state) {
                final cubit = context.read<CheckoutCubit>();
                return ShippingAddressViewBody(
                  fullName: cubit.fullName,
                  phoneNumber: cubit.phoneNumber,
                  streetName: cubit.streetName,
                  city: cubit.city,
                  postalCode: cubit.postalCode,
                  onPressed: () {
                    cubit.addUserAddress();
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
