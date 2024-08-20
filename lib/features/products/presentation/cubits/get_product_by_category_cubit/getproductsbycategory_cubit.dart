import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/repo/product_repo.dart';

import 'getproductsbycategory_state.dart';

class GetProductsByCategoryCubit extends Cubit<GetProductsByCategoryState> {
  GetProductsByCategoryCubit(this._productRepo)
      : super(GetproductsbycategoryInitial());

  final ProductRepo _productRepo;

  Future<void> getProductsByCategory({required String category}) async {
    final data = await _productRepo.getProductsByCategory(category: category);

    data.fold(
      (error) => emit(
        GetproductsbycategoryFailure(errMessage: error.errMessage),
      ),
      (products) => emit(
        GetproductsbycategoryLoaded(products: products),
      ),
    );
  }
}
