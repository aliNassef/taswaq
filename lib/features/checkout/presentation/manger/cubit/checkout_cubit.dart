import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'checkout_state.dart';

class CheckoutCubit extends Cubit<CheckoutState> {
  CheckoutCubit() : super(const CheckoutState(state: CheckoutStatus.initial));

  TextEditingController fullName = TextEditingController();
  TextEditingController phoneNumber = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController streetName = TextEditingController();
  TextEditingController postalCode = TextEditingController();
}
