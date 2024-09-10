import 'package:flutter_bloc/flutter_bloc.dart';

part 'change_nav_state.dart';

class ChangeNavCubit extends Cubit<ChangeNavState> {
  ChangeNavCubit() : super(ChangeNavInitial());

  int currentIndex = 0;

  void changeNavIndex(int index) {
    currentIndex = index;
    emit(ChangeNavSuccess());
  }
}
