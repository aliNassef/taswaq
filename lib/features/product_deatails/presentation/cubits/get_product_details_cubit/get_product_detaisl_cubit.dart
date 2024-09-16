import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../domain/repo/product_details_repo.dart';

import '../../../domain/entity/product_detais_entity/product_details_entity.dart';

part 'get_product_detaisl_state.dart';

class GetProductDetailsCubit extends Cubit<GetProductDetailsState> {
  GetProductDetailsCubit(this._productDetailsRepo)
      : super(GetProductDetaislInitial());
  final ProductDetailsRepo _productDetailsRepo;

  Future<void> getProductDetails({required int productId}) async {
    emit(GetProductDetaislLoading());
    final result = await _productDetailsRepo.getProductDetails(id: productId);
    result.fold(
        (l) => emit(
              GetProductDetaislFailure(errMessage: l.errMessage),
            ), (r) async {
      await init(productId: productId);
      emit(
        GetProductDetaislLoaded(
          productDetailsEntity: r,
        ),
      );
    });
  }

  bool isFav = false;

  Future<void> init({required int productId}) async {
    isFav = await _productDetailsRepo.isProductExist(id: productId.toString());
  }

  Future<void> toggleFavorite({
    required ProductDetailsEntity product,
  }) async {
    bool isExist =
        await _productDetailsRepo.isProductExist(id: product.id.toString());
    if (isExist) {
      await _productDetailsRepo.deleteProductFromWishList(
          id: product.id.toString());
      isFav = false;
    } else {
      await _productDetailsRepo.addProductToWishList(product: product);
      isFav = true;
    }
    emit(ToggleFavoriteSuccess());
  }
}
