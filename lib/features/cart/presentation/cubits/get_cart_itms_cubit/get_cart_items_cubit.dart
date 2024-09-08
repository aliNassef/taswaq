import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:taswaq/core/api/end_ponits.dart';
import 'package:taswaq/core/cache/cache_helper.dart';
import 'package:taswaq/core/di/dependency_injuction.dart';
import 'package:taswaq/features/cart/domain/entities/cart_entity.dart';
import 'package:taswaq/features/cart/domain/repo/cart_repo.dart';

part 'get_cart_items_state.dart';

class GetCartItemsCubit extends Cubit<GetCartItemsState> {
  GetCartItemsCubit(this._cartRepo) : super(GetCartItemsInitial());
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
}
