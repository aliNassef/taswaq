import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/entities/product_entity/product_entity.dart';
import '../../../domain/repo/home_repo.dart';
part 'get_products_state.dart';

class GetProductsCubit extends Cubit<GetProductsState> {
  GetProductsCubit(this._homeRepo) : super(GetProductsInitial());
  final HomeRepo _homeRepo;
  Set<int> wishList = {};

  Future<void> getProducts() async {
    emit(GetProductsLoading());
    final data = await _homeRepo.getProducts();
    data.fold((error) => emit(GetProductsFailure(errMessage: error.errMessage)),
        (listOfProducts) async {
      // need refactor here
      await Future.forEach(listOfProducts, (product) async {
        bool isInWishList =
            await isProductInWishList(productId: product.id.toString());

        if (isInWishList) {
          wishList.add(product.id!);
        }
      });
      emit(
        GetProductsLoaded(
          productList: listOfProducts,
        ),
      );
    });
  }

  Future<void> toggleFavorite({required ProductEntity product}) async {
    if (wishList.contains(product.id!)) {
      await deleteProductFromWishList(id: product.id.toString());
      wishList.remove(product.id!);
    } else {
      await addProductToWishList(product: product);
      wishList.add(product.id!);
    }
    emit(ToggleFavorite());
  }

  Future<void> addProductToWishList({required ProductEntity product}) async {
    await _homeRepo.addProductToWishList(product: product);
  }

  Future<void> deleteProductFromWishList({required String id}) async {
    await _homeRepo.deleteProductFromWishList(id: id);
  }

  Future<bool> isProductInWishList({required String productId}) async {
    return await _homeRepo.isProductInWishList(productId: productId);
  }
}
