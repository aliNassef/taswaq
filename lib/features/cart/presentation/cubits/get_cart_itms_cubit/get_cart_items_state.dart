part of 'get_cart_items_cubit.dart';

@immutable
sealed class GetCartItemsState {}

final class GetCartItemsInitial extends GetCartItemsState {}

final class GetCartItemsLoading extends GetCartItemsState {}

final class GetCartItemsLoaded extends GetCartItemsState {
  final List<CartEntity> cartItems;

  GetCartItemsLoaded({required this.cartItems});
}

final class GetCartItemsFailure extends GetCartItemsState {
  final String errMessage;

  GetCartItemsFailure({required this.errMessage});
}
