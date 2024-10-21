import '../../../domain/entity/order_entity.dart';

sealed class OrderHistoryState {}

final class OrderHistoryInitial extends OrderHistoryState {}

final class OrderHistoryChangePage extends OrderHistoryState {
  final List<OrderEntity> orderHistory;

  OrderHistoryChangePage({required this.orderHistory});
}

final class OrderHistoryLoading extends OrderHistoryState {}

final class OrderHistorySuccess extends OrderHistoryState {
  final List<OrderEntity> orderHistory;
  OrderHistorySuccess({required this.orderHistory});
}

final class OrderHistoryFailure extends OrderHistoryState {
  final String errMessage;
  OrderHistoryFailure({required this.errMessage});
}
