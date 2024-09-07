part of 'add_product_to_cart_cubit.dart';

sealed class AddProductToCartState {}

final class AddProductToCartInitial extends AddProductToCartState {}

final class AddProductToCartSuccess extends AddProductToCartState {}

final class AddProductToCartFailure extends AddProductToCartState {}

final class QuantityIncremented extends AddProductToCartState {}

final class QuantityDecremented extends AddProductToCartState {}
