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
    log(getIt.get<CacheHelper>().getData(key: ApiKey.userId).toString());
    emit(GetCartItemsLoading());
    final result = await _cartRepo.getUserCart(id: id);
    result.fold(
      (l) => emit(
        GetCartItemsFailure(errMessage: l.errMessage),
      ),
      (r) => emit(
        GetCartItemsLoaded(
          cartItems: r,
        ),
      ),
    );
  }
}
