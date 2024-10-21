import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taswaq/features/profile/domain/repo/profile_repo.dart';
import '../../../domain/entity/order_entity.dart';
import 'order_history_state.dart';

class OrderHistoryCubit extends Cubit<OrderHistoryState> {
  OrderHistoryCubit(this._profileRepo) : super(OrderHistoryInitial());
  final ProfileRepo _profileRepo;
  int currentPage = 1;
  void changeOrderPage(int page, List<OrderEntity> order) {
    currentPage = page;
    emit(OrderHistoryChangePage(orderHistory: order));
  }

  Future<void> getUserOrders() async {
    emit(OrderHistoryLoading());
    final result = await _profileRepo.getUserOrders();
    result.fold(
      (error) => emit(
        OrderHistoryFailure(errMessage: error.errMessage),
      ),
      (data) {
        log(data[0].orders[0].title.toString());
        emit(
          OrderHistorySuccess(
            orderHistory: data,
          ),
        );
      },
    );
  }
}
