import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taswaq/core/shared/functions/get_user_data.dart';

import '../../../../profile/domain/entity/address_entity.dart';
import '../../../domain/repo/checkout_repo.dart';
import 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit(this.checkoutRepo)
      : super(const CheckoutState(state: CheckoutStatus.initial));
  final CheckoutRepo checkoutRepo;
  TextEditingController fullName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController streetName = TextEditingController();
  TextEditingController postalCode = TextEditingController();
  Future<void> addUserAddress() async {
    emit(state.copyWith(state: CheckoutStatus.loading));
    try {
      await checkoutRepo.addAddress(
        address: AddressEntity(
          name: fullName.text,
          id: getUserData().id!,
          street: streetName.text,
          phoneNumber: phoneNumber.text,
          city: city.text,
          postalCode: postalCode.text,
        ),
      );
      emit(state.copyWith(state: CheckoutStatus.success));
    } catch (e) {
      emit(
        state.copyWith(
          state: CheckoutStatus.failure,
          errMessage: e.toString(),
        ),
      );
    }
  }
}
