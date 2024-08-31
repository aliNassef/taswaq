import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/product_entity/product_entity.dart';
import '../../../domain/repo/home_repo.dart';
part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit(this._homeRepo) : super(GetProductsInitial());
  final HomeRepo _homeRepo;
  getProducts() async {
    emit(GetProductsLoading());
    final data = await _homeRepo.getProducts();
    data.fold(
      (error) => emit(GetProductsFailure(errMessage: error.errMessage)),
      (listOfProducts) => emit(
        GetProductsLoaded(
          productList: listOfProducts,
        ),
      ),
    );
  }
}
