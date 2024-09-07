import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taswaq/features/product_deatails/domain/entity/product_detais_entity/product_details_entity.dart';
import 'package:taswaq/features/product_deatails/domain/repo/product_details_repo.dart';

part 'add_product_to_cart_state.dart';

class AddProductToCartCubit extends Cubit<AddProductToCartState> {
  AddProductToCartCubit(this._detailsRepo) : super(AddProductToCartInitial());
  final ProductDetailsRepo _detailsRepo;
  int quantity = 1;

  void incrementQuantity() {
    quantity++;
    emit(QuantityIncremented());
  }


  void decrementQuantity() {
    if (quantity > 1) {
      quantity--;
      emit(QuantityDecremented());
    }
  }

  Future<void> addProductToCart({
    required String userId,
    required ProductDetailsEntity product,
  }) async {
    try {
      await _detailsRepo.addToCart(
        product: product,
        userId: userId,
        quantity: quantity,
      );
      emit(AddProductToCartSuccess());
    } catch (e) {
      log(e.toString());
      emit(AddProductToCartFailure());
    }
  }
}
