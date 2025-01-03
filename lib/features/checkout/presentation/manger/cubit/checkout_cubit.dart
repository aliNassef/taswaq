import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/shared/functions/get_user_data.dart';

import '../../../../profile/domain/entity/address_entity.dart';
import '../../../domain/entity/order_entity.dart';
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

  Future<void> getUserAddress() async {
    emit(state.copyWith(state: CheckoutStatus.loading));
    final data = await checkoutRepo.getAddress();
    data.fold(
      (error) => emit(
        state.copyWith(
            state: CheckoutStatus.failure, errMessage: error.errMessage),
      ),
      (address) => emit(
        state.copyWith(state: CheckoutStatus.success, address: address),
      ),
    );
  }

  // add order cubit
  Future<void> addOrder({required OrderEntity order}) async {
    emit(state.copyWith(state: CheckoutStatus.loading));

    final response = await checkoutRepo.addOrder(
      order: order,
    );
    response.fold(
      (failure) => emit(
        state.copyWith(
          state: CheckoutStatus.failure,
          errMessage: failure.errMessage,
        ),
      ),
      (r) => emit(
        state.copyWith(
          state: CheckoutStatus.addOrderSuccess,
          order: order,
        ),
      ),
    );
  }
}
