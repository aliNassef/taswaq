import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../domain/entities/cart_entity.dart';
import '../../../domain/repo/cart_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this._cartRepo) : super(GetCartItemsInitial());
  final CartRepo _cartRepo;

  Future<void> getCartItems({required String id}) async {
    emit(GetCartItemsLoading());
    try {
      final stream = _cartRepo.getUserCart(id: id);
      await for (final result in stream) {
        result.fold(
          (failure) {
            emit(GetCartItemsFailure(errMessage: failure.errMessage));
          },
          (cartItems) {
            emit(GetCartItemsLoaded(cartItems: cartItems));
          },
        );
      }
    } catch (error) {
      log('Error getting cart items: $error');
      emit(GetCartItemsFailure(
          errMessage: 'Error occurred while fetching cart items'));
    }
  }

  Future<void> deleteCartItem({required String id}) async {
    await _cartRepo.deleteCartItem(id: id);
    emit(DeleteCartItemsSuccess());
  }

  Future<void> incrementQuantity(
      {required String id, required int quantity}) async {
    await _cartRepo.updateItemQuantity(
      id: id,
      quantity: quantity,
    );
    emit(IncrementQuantity());
  }

  Future<void> decrementQuantity(
      {required String id, required int quantity}) async {
    await _cartRepo.updateItemQuantity(
      id: id,
      quantity: quantity,
    );
    emit(DecrementQuantity());
  }
}
