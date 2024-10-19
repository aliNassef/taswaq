import '../../../../profile/domain/entity/address_entity.dart';
import '../../../domain/entity/order_entity.dart';

enum CheckoutStatus { initial, loading, success, failure, addOrderSuccess }

extension CheckoutStateX on CheckoutState {
  bool get isInitial => state == CheckoutStatus.initial;
  bool get isLoading => state == CheckoutStatus.loading;
  bool get isSuccess => state == CheckoutStatus.success;
  bool get isFailure => state == CheckoutStatus.failure;
  bool get isAddedOrderSuccess => state == CheckoutStatus.addOrderSuccess;
}

class CheckoutState {
  final CheckoutStatus state;
  final String? errMessage;
  final AddressEntity? address;
  final OrderEntity? order;
  const CheckoutState(
      {this.address, required this.state, this.errMessage, this.order});

  CheckoutState copyWith({
    CheckoutStatus? state,
    String? errMessage,
    AddressEntity? address,
    OrderEntity? order,
  }) {
    return CheckoutState(
      state: state ?? this.state,
      errMessage: errMessage ?? this.errMessage,
      address: address ?? this.address,
      order: order ?? this.order,
    );
  }

  @override
  String toString() {
    return 'CheckoutState(state: $state, errMessage: $errMessage, address: $address, order: $order)';
  }
}
