import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taswaq/features/profile/domain/repo/profile_repo.dart';

import 'order_history_state.dart';

class OrderHistoryCubit extends Cubit<OrderHistoryState> {
  OrderHistoryCubit(this._profileRepo) : super(OrderHistoryInitial());
  final ProfileRepo _profileRepo;
  int currentPage = 1;
  void changeOrderPage(int page) {
    currentPage = page;
    emit(OrderHistoryChangePage());
  }

  Future<void> getUserOrders() async {
    emit(OrderHistoryLoading());
    final result = await _profileRepo.getUserOrders();
    result.fold(
      (error) => emit(
        OrderHistoryFailure(errMessage: error.errMessage),
      ),
      (data) => emit(
        OrderHistorySuccess(
          orderHistory: data,
        ),
      ),
    );
  }
}
