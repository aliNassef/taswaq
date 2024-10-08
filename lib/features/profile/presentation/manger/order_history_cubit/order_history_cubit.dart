import 'package:flutter_bloc/flutter_bloc.dart';

import 'order_history_state.dart';

 
class OrderHistoryCubit extends Cubit<OrderHistoryState> {
  OrderHistoryCubit() : super(OrderHistoryInitial());
  int currentPage = 1;
  void changeOrderPage(int page) {
    currentPage = page;
    emit(OrderHistoryChangePage());
  }
}
