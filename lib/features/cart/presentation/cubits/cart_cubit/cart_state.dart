part of 'cart_cubit.dart';

@immutable
sealed class CartState {}

final class GetCartItemsInitial extends CartState {}

final class GetCartItemsLoading extends CartState {}

final class GetCartItemsLoaded extends CartState {
  final List<CartEntity> cartItems;

  GetCartItemsLoaded({required this.cartItems});
}

final class GetCartItemsFailure extends CartState {
  final String errMessage;

  GetCartItemsFailure({required this.errMessage});
}

final class DeleteCartItemsSuccess extends CartState {}
final class IncrementQuantity extends CartState {}
final class DecrementQuantity extends CartState {}
