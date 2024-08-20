import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repo/home_repo.dart';

import 'get_categories_state.dart';

class GetCategoriesCubit extends Cubit<GetCategoriesState> {
  GetCategoriesCubit(this._homeRepo) : super(GetCategoriesInitial());
  final HomeRepo _homeRepo;
  Future<void> getCategories() async {
    emit(GetCategoriesLoading());
    final response = await _homeRepo.getCategories();
    response.fold(
      (failure) => emit(
        GetCategoriesFailure(errMessage: failure.errMessage),
      ),
      (categories) => emit(
        GetCategoriesLoaded(categories: categories),
      ),
    );
  }
}
