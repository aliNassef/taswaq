import '../../../../profile/domain/entity/address_entity.dart';

enum CheckoutStatus { initial, loading, success, failure }

extension CheckoutStateX on CheckoutState {
  bool get isInitial => state == CheckoutStatus.initial;
  bool get isLoading => state == CheckoutStatus.loading;
  bool get isSuccess => state == CheckoutStatus.success;
  bool get isFailure => state == CheckoutStatus.failure;
}

class CheckoutState {
  final CheckoutStatus state;
  final String? errMessage;
  final AddressEntity? address;
  const CheckoutState({this.address, required this.state, this.errMessage});

  CheckoutState copyWith(
      {CheckoutStatus? state, String? errMessage, AddressEntity? address}) {
    return CheckoutState(
      state: state ?? this.state,
      errMessage: errMessage ?? this.errMessage,
      address: address ?? this.address,
    );
  }
}
